PEOPLE = [
    ["Person 1", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
    ["Person 2", "https://avataaars.io/?avatarStyle=Circle&topType=ShortHairShortCurly&accessoriesType=Sunglasses&hairColor=Platinum&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=ShirtVNeck&clotheColor=Gray01&eyeType=Close&eyebrowType=SadConcerned&mouthType=Disbelief&skinColor=Light"],
    ["Person 3", "https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Round&hairColor=BlondeGolden&facialHairType=BeardLight&facialHairColor=BlondeGolden&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Close&eyebrowType=RaisedExcitedNatural&mouthType=Twinkle&skinColor=DarkBrown"],
    ["Person 4", "https://avataaars.io/?avatarStyle=Circle&topType=ShortHairSides&accessoriesType=Wayfarers&hairColor=BlondeGolden&facialHairType=Blank&facialHairColor=BlondeGolden&clotheType=BlazerSweater&clotheColor=Blue03&graphicType=Resist&eyeType=Surprised&eyebrowType=AngryNatural&mouthType=Twinkle&skinColor=Pale"],
    ["Person 5", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairFro&accessoriesType=Prescription01&hairColor=Red&facialHairType=BeardMedium&facialHairColor=BrownDark&clotheType=Hoodie&clotheColor=PastelYellow&eyeType=Hearts&eyebrowType=SadConcernedNatural&mouthType=ScreamOpen&skinColor=Brown"],
]

class Person
    PEOPLE = PEOPLE

    def self.random
        PEOPLE.sample
    end

    def self.options(exclude, amount)
        avalible = PEOPLE.filter do |person|
            person[0] != exclude[0]
        end
        
        options = avalible.shuffle.first(amount - 1)
        options << exclude
        return options.shuffle
    end

    ##
    # Väljer 1 person, och ger 5 namn varav 1 är rätt
    #
    def self.quiz
        correct = Person.random
        alternatives = Person.options(correct, 5)

        return { correct: correct, alternatives: alternatives }

    end
end