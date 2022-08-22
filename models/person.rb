# frozen_string_literal: true

PEOPLE_ARRAY = [{
  id: 'bca3ae18-ef0a-4139-8b09-1db8b274fb4a',
  name: 'Luisa Lavens'
}, {
  id: 'fef5d4ab-e8bc-4f1e-bcc8-b7b082d20063',
  name: 'Jillian Bischoff'
}, {
  id: 'ac3d2b7a-97e4-45b8-9446-441932da6404',
  name: 'Wittie Cronin'
}, {
  id: 'c80994bd-2106-41fe-8ab4-ff05a801d979',
  name: 'Tamarah Disbrey'
}, {
  id: 'f1150a47-8f62-48ed-adde-4d1d2adc461c',
  name: 'Manolo Crighton'
}, {
  id: '10c1f3bf-8781-42fd-aa64-9310a36ddc7d',
  name: 'Wileen Kubes'
}, {
  id: 'd33c7746-1643-41ba-8b9b-f5e4d799e70a',
  name: 'Dwight Gitting'
}, {
  id: '92c5f367-65a5-4770-8580-297a92d360f7',
  name: 'Kellina Flowith'
}, {
  id: 'ff9e6d07-af75-40b6-9ab1-fce67cd366e6',
  name: 'Randy Daw'
}, {
  id: '36b80284-7d32-4dba-ac69-2aa61f280318',
  name: 'Loree Dowber'
}, {
  id: 'ebccd301-23e2-406f-9f25-08009998efcd',
  name: 'Leslie Kennifeck'
}, {
  id: '44edf2a5-3626-4778-b69e-62cf333bc935',
  name: 'Jessica Enocksson'
}, {
  id: '7401344d-aedf-4b22-9962-427160c71b9e',
  name: 'Kirby Hanning'
}, {
  id: 'd8879f72-1d8e-4682-9db9-be9ffaaee1c6',
  name: 'Nissie Saket'
}, {
  id: 'abe6554e-b4a1-44d3-9401-76a8a8de5a10',
  name: 'Ermanno Honatsch'
}, {
  id: '2d82c420-e327-4ded-8f1b-2618d2fa909b',
  name: 'Ivie Bagniuk'
}, {
  id: 'fd0635a3-9e09-4979-8116-80574ead21b5',
  name: 'Berton Paynter'
}, {
  id: '65ca9e91-4088-4c33-b3b8-85f9298db756',
  name: 'Cooper Wolland'
}, {
  id: '87e8a33d-8a47-443c-a2d4-4717b535f769',
  name: 'Mandie Corbridge'
}, {
  id: '982fa023-e803-4e7c-826f-04707c7b9923',
  name: 'Annette Messham'
}].first(1).freeze

class Person
  attr_reader :id, :name, :avatar

  def initialize(id, name)
    @id = id
    @name = name
    @avatar = Avatar.new(id)
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => {
        'id' => @id,
        'name' => @name
      }
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o['data']['id'], o['data']['name'])
  end
end
