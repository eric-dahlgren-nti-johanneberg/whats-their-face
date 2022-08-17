PEOPLE = [
    ["Person 1", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
    ["Person 2", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
    ["Person 3", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
    ["Person 4", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
    ["Person 5", "https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Blank&hairColor=Red&facialHairType=MoustacheFancy&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=WinkWacky&eyebrowType=UpDownNatural&mouthType=Disbelief&skinColor=DarkBrown"],
]

class Person
    PEOPLE = PEOPLE

    def self.random
        PEOPLE.sample
    end
end