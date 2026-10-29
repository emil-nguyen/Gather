
import SwiftUI

// MARK: - Gather

@main
struct GatherApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

// MARK: - Gather Colors

extension Color {
    static let gatherCream = Color(hex: 0xF3E9D8)
    static let gatherEspresso = Color(hex: 0x4B3027)
    static let gatherPaper = Color(hex: 0xFBF6ED)

    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

// MARK: - Game Model

struct PartyGame: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let description: String
    let instructions: [String]
    let minPlayers: Int
    let duration: String
    let prompts: [String]
}

let gatherGames: [PartyGame] = [

    // CHAOS OG BLUFF

    PartyGame(
        category: "Kaos og bluff",
        title: "Imposter",
        description: "Find personen, der ikke kender ordet.",
        instructions: [
            "Vælg én person som imposter.",
            "Alle andre får det samme hemmelige ord.",
            "På skift giver alle et hint uden at afsløre ordet.",
            "Diskutér og stem på den, I tror er imposteren."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Hemmelighedsord: Pizza",
            "Hemmelighedsord: Strand",
            "Hemmelighedsord: Biograf",
            "Hemmelighedsord: Ferie"
        ]
    ),

    PartyGame(
        category: "Kaos og bluff",
        title: "To sandheder",
        description: "Kan gruppen gennemskue dit bluff?",
        instructions: [
            "En spiller fortæller tre ting om sig selv.",
            "To ting skal være sande, og én skal være løgn.",
            "Resten af gruppen gætter på løgnen.",
            "Afslør svaret, og lad næste spiller tage sin tur."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Fortæl om en pinlig oplevelse.",
            "Fortæl om noget mærkeligt, du har gjort.",
            "Fortæl om et talent, du måske ikke har.",
            "Fortæl om en vild oplevelse."
        ]
    ),

    PartyGame(
        category: "Kaos og bluff",
        title: "Hvem lyver?",
        description: "Én historie er opdigtet.",
        instructions: [
            "En spiller fortæller en kort historie.",
            "Spilleren vælger selv, om historien er sand eller falsk.",
            "Alle andre stiller ét spørgsmål.",
            "Gruppen stemmer om, hvorvidt historien er sand."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Fortæl om din værste date.",
            "Fortæl om noget, du aldrig har fortalt gruppen.",
            "Fortæl om en mærkelig drøm.",
            "Fortæl om din vildeste fest."
        ]
    ),

    // GRIN OG UDFORDRINGER

    PartyGame(
        category: "Grin og udfordringer",
        title: "Gør det eller grin",
        description: "En sjov udfordring til hver spiller.",
        instructions: [
            "Læs udfordringen højt.",
            "Spilleren vælger, om udfordringen skal gennemføres.",
            "Gruppen må gerne grine, men hold det venligt.",
            "Giv turen videre til næste spiller."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Dans uden musik i 15 sekunder.",
            "Tal som en robot i din næste tur.",
            "Lav din bedste kendis-imitation.",
            "Syng om personen til venstre.",
            "Fortæl en joke uden at grine."
        ]
    ),

    PartyGame(
        category: "Grin og udfordringer",
        title: "10/10",
        description: "Bedøm de skøre scenarier.",
        instructions: [
            "Læs et scenarie højt.",
            "Alle giver scenariet en karakter fra 1 til 10.",
            "Forklar jeres bedømmelse.",
            "Sammenlign de sjoveste svar."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "En 10/10, men personen klapper efter landing i flyet.",
            "En 10/10, men sender kun talebeskeder.",
            "En 10/10, men er altid 45 minutter forsinket.",
            "En 10/10, men hader din yndlingsmad.",
            "En 10/10, men taler kun i citater."
        ]
    ),

    PartyGame(
        category: "Grin og udfordringer",
        title: "Sig det med stil",
        description: "Sig en almindelig sætning på en skør måde.",
        instructions: [
            "Træk en sætning.",
            "Læs den med den angivne stemning.",
            "Gruppen gætter stemningen.",
            "Skift spiller."
        ],
        minPlayers: 2,
        duration: "5 min.",
        prompts: [
            "Sig 'jeg er sulten' som en skurk.",
            "Sig 'godmorgen' som en operasanger.",
            "Sig 'hvor er min telefon?' som en detektiv.",
            "Sig 'det var ikke mig' som en robot."
        ]
    ),

    // VENSKAB OG DILEMMAER

    PartyGame(
        category: "Venskab og dilemmaer",
        title: "Kiss, Marry, Kill",
        description: "Vælg mellem tre fiktive personer.",
        instructions: [
            "Læs de tre valgmuligheder.",
            "Vælg én til hvert af de tre valg.",
            "Forklar dit valg, hvis du har lyst.",
            "Gruppen kan diskutere svarene."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Spider-Man, Batman eller Superman?",
            "En eventyrer, en kok eller en rockstjerne?",
            "En vampyr, en varulv eller et spøgelse?",
            "En komiker, en musiker eller en skuespiller?"
        ]
    ),

    PartyGame(
        category: "Venskab og dilemmaer",
        title: "Hvem er mest tilbøjelig?",
        description: "Peg på den person, der passer bedst.",
        instructions: [
            "Læs spørgsmålet højt.",
            "Alle peger samtidig på en person.",
            "Den person med flest stemmer må forklare sig.",
            "Fortsæt med næste spørgsmål."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Hvem ville overleve kortest på en øde ø?",
            "Hvem ville blive berømt først?",
            "Hvem ville glemme sin egen fødselsdag?",
            "Hvem ville komme til at afsløre en hemmelighed?",
            "Hvem ville spontant rejse til et andet land?"
        ]
    ),

    PartyGame(
        category: "Venskab og dilemmaer",
        title: "Ville du hellere?",
        description: "To valg, ingen nem udvej.",
        instructions: [
            "Læs de to muligheder.",
            "Alle vælger én mulighed.",
            "Forklar, hvorfor I valgte den.",
            "Prøv at overbevise gruppen om jeres valg."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Kunne læse tanker eller se fremtiden?",
            "Aldrig bruge sociale medier eller aldrig se film igen?",
            "Være berømt eller være millionær i hemmelighed?",
            "Altid komme for tidligt eller altid lidt for sent?",
            "Kunne teleportere eller flyve?"
        ]
    ),

    // ORD OG GÆT

    PartyGame(
        category: "Ord og gæt",
        title: "Charades",
        description: "Mime ordet uden at sige noget.",
        instructions: [
            "En spiller vælger et ord.",
            "Mime ordet uden at tale.",
            "De andre gætter, inden tiden løber ud.",
            "Giv turen videre."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "En pingvin",
            "At børste tænder",
            "En fodboldspiller",
            "At være forelsket",
            "En kat, der er sur"
        ]
    ),

    PartyGame(
        category: "Ord og gæt",
        title: "Tabu",
        description: "Forklar ordet uden at bruge det.",
        instructions: [
            "En spiller vælger et ord.",
            "Forklar ordet uden at sige selve ordet.",
            "Gruppen gætter.",
            "Skift spiller efter hvert ord."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Pizza",
            "Tandlæge",
            "Ferie",
            "Kærlighed",
            "Mobiltelefon"
        ]
    ),

    PartyGame(
        category: "Ord og gæt",
        title: "Hurtig association",
        description: "Svar hurtigt, og hold kæden i gang.",
        instructions: [
            "En spiller siger et ord.",
            "Næste spiller siger det første ord, de tænker på.",
            "Gentag hurtigt rundt i gruppen.",
            "Tøven eller gentagelser giver en sjov ekstra udfordring."
        ],
        minPlayers: 3,
        duration: "5 min.",
        prompts: [
            "Startord: Sommer",
            "Startord: Fest",
            "Startord: Kærlighed",
            "Startord: Kaos"
        ]
    ),

    // FLIRT OG SPICY

    PartyGame(
        category: "Flirt og spicy",
        title: "Flirt eller fakta",
        description: "Svar ærligt, eller giv et flirtende svar.",
        instructions: [
            "Læs spørgsmålet højt.",
            "Spilleren svarer ærligt eller flirtende.",
            "Man må altid springe over.",
            "Hold stemningen sjov og respektfuld."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Hvad lægger du først mærke til hos en person?",
            "Hvad er din største green flag?",
            "Hvad er den bedste kompliment, du har fået?",
            "Hvad er din idé om en perfekt date?",
            "Hvad får dig til at blive genert?"
        ]
    ),

    PartyGame(
        category: "Flirt og spicy",
        title: "Crush-kortet",
        description: "Sjove spørgsmål om forelskelse.",
        instructions: [
            "Læs et kort højt.",
            "Svar, eller vælg at springe over.",
            "Gruppen må stille ét opfølgende spørgsmål.",
            "Gå videre til næste spiller."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Hvad er dit største turn-on i en personlighed?",
            "Hvad er dit mest akavede flirt-forsøg?",
            "Hvem ville du invitere på en spontan date?",
            "Hvad er et undervurderet romantisk øjeblik?",
            "Hvad er dit tydeligste tegn på interesse?"
        ]
    ),

    PartyGame(
        category: "Flirt og spicy",
        title: "Red flag eller green flag",
        description: "Vurdér dating-situationer.",
        instructions: [
            "Læs situationen.",
            "Alle vælger red flag eller green flag.",
            "Forklar jeres mening.",
            "I må gerne være uenige."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "De husker små detaljer, du har fortalt.",
            "De svarer først efter tre dage.",
            "De er venlige mod servicepersonale.",
            "De vil planlægge alle jeres dates.",
            "De kan sige undskyld, når de tager fejl."
        ]
    ),

    // STRATEGI OG MYSTERIER

    PartyGame(
        category: "Strategi og mysterier",
        title: "Mafia",
        description: "Find mafiaen blandt jer.",
        instructions: [
            "Udpeg en person som spilstyrer.",
            "Fordel roller hemmeligt mellem mafia og borgere.",
            "Mafiaen vælger en person om natten.",
            "Gruppen diskuterer og stemmer om en mistænkt om dagen."
        ],
        minPlayers: 5,
        duration: "15 min.",
        prompts: [
            "Hvem virker mest mistænkelig?",
            "Hvem har det bedste alibi?",
            "Hvem ændrede mening først?",
            "Hvem prøver at styre diskussionen?"
        ]
    ),

    PartyGame(
        category: "Strategi og mysterier",
        title: "Fake or Fact",
        description: "Kan du skelne fakta fra fiktion?",
        instructions: [
            "Læs udsagnet højt.",
            "Alle gætter på sandt eller falsk.",
            "Afslør svaret og forklar det.",
            "Point kan gives for rigtige gæt."
        ],
        minPlayers: 2,
        duration: "10 min.",
        prompts: [
            "Blæksprutter har tre hjerter.",
            "Mennesker bruger kun 10 % af hjernen.",
            "Honning kan holde sig meget længe under gode forhold.",
            "Flagermus er blinde.",
            "Et døgn på Venus er længere end et år på Venus."
        ]
    ),

    PartyGame(
        category: "Strategi og mysterier",
        title: "Det perfekte alibi",
        description: "Find hullet i historien.",
        instructions: [
            "En spiller fortæller, hvor de var.",
            "De andre stiller spørgsmål til historien.",
            "Spilleren skal holde sin forklaring sammenhængende.",
            "Gruppen gætter på, om historien hænger sammen."
        ],
        minPlayers: 3,
        duration: "10 min.",
        prompts: [
            "Du var væk hele lørdag. Hvor var du?",
            "Hvorfor svarede du ikke på telefonen?",
            "Hvem kan bekræfte din historie?",
            "Hvad var det første, du gjorde, da du kom hjem?"
        ]
    )
]

// MARK: - Home Screen

struct HomeView: View {
    private let categories: [(String, String)] = [
        ("Kaos og bluff", "theatermasks.fill"),
        ("Grin og udfordringer", "face.smiling.fill"),
        ("Venskab og dilemmaer", "heart.fill"),
        ("Ord og gæt", "text.bubble.fill"),
        ("Flirt og spicy", "flame.fill"),
        ("Strategi og mysterier", "eye.fill")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.gatherCream.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("gather.")
                                    .font(.system(size: 42, weight: .bold))
                                Text("Good friends. Great games.")
                                    .font(.subheadline)
                                    .foregroundStyle(
                                        Color.gatherEspresso.opacity(0.65)
                                    )
                            }

                            Spacer()

                            Image(systemName: "sparkles")
                                .font(.system(size: 28))
                        }
                        .foregroundStyle(Color.gatherEspresso)
                        .padding(.top, 12)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Hvad er stemningen?")
                                .font(.title2.bold())
                            Text("Vælg en kategori, og saml vennerne.")
                                .foregroundStyle(.secondary)
                        }
                        .foregroundStyle(Color.gatherEspresso)

                        ForEach(categories, id: \.0) { category, icon in
                            NavigationLink {
                                CategoryView(category: category.0)
                            } label: {
                                HStack(spacing: 14) {
                                    Image(systemName: icon)
                                        .font(.title3)
                                        .frame(width: 32)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(category)
                                            .font(.headline)
                                        Text(
                                            "\(gatherGames.filter { $0.category == category }.count) spil"
                                        )
                                        .font(.caption)
                                        .opacity(0.75)
                                    }

                                    Spacer()

                                    Image(systemName: "arrow.up.right")
                                }
                                .foregroundStyle(Color.gatherPaper)
                                .padding(18)
                                .background(Color.gatherEspresso)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 20)
                                )
                            }
                            .buttonStyle(.plain)
                        }

                        Text("Lav minder. Grin højt. Spil sammen.")
                            .font(.footnote)
                            .foregroundStyle(Color.gatherEspresso.opacity(0.65))
                            .frame(maxWidth: .infinity)
                            .padding(.top, 8)
                    }
                    .padding(22)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .tint(Color.gatherEspresso)
    }
}

// MARK: - Category Screen

struct CategoryView: View {
    let category: String

    private var games: [PartyGame] {
        gatherGames.filter { $0.category == category }
    }

    var body: some View {
        ZStack {
            Color.gatherCream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(category)
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.gatherEspresso)

                    Text("Vælg et spil for at komme i gang.")
                        .foregroundStyle(.secondary)

                    ForEach(games) { game in
                        NavigationLink {
                            GameView(game: game)
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(game.title)
                                    .font(.title3.bold())
                                Text(game.description)
                                    .font(.subheadline)
                                HStack {
                                    Label(
                                        "\(game.minPlayers)+ spillere",
                                        systemImage: "person.2"
                                    )
                                    Spacer()
                                    Label(
                                        game.duration,
                                        systemImage: "clock"
                                    )
                                }
                                .font(.caption)
                                .opacity(0.75)
                            }
                            .foregroundStyle(Color.gatherPaper)
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gatherEspresso)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 18)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(22)
            }
        }
        .navigationTitle("Spil")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Rules and Gameplay

struct GameView: View {
    let game: PartyGame

    @State private var hasStarted = false
    @State private var promptIndex = 0

    var body: some View {
        ZStack {
            Color.gatherCream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    if !hasStarted {
                        rulesScreen
                    } else {
                        playingScreen
                    }
                }
                .padding(24)
            }
        }
        .foregroundStyle(Color.gatherEspresso)
        .navigationTitle(game.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var rulesScreen: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "book.closed.fill")
                .font(.system(size: 38))
                .padding(.top, 12)

            Text("Sådan spiller I")
                .font(.largeTitle.bold())

            Text(game.description)
                .font(.title3)
                .foregroundStyle(Color.gatherEspresso.opacity(0.7))

            HStack(spacing: 18) {
                Label("\(game.minPlayers)+ spillere", systemImage: "person.2")
                Label(game.duration, systemImage: "clock")
            }
            .font(.subheadline.bold())

            Divider()

            ForEach(
                Array(game.instructions.enumerated()),
                id: \.offset
            ) { index, instruction in
                HStack(alignment: .top, spacing: 14) {
                    Text("\(index + 1)")
                        .font(.headline)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.gatherPaper)
                        .background(Color.gatherEspresso)
                        .clipShape(Circle())

                    Text(instruction)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Text("Husk: Alle skal have det sjovt. Man må altid springe over.")
                .font(.footnote)
                .foregroundStyle(Color.gatherEspresso.opacity(0.7))
                .padding(.top, 4)

            Button {
                hasStarted = true
            } label: {
                Text("Forstået — lad os spille")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.gatherPaper)
                    .background(Color.gatherEspresso)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.top, 8)
        }
    }

    private var playingScreen: some View {
        VStack(alignment: .leading, spacing: 22) {
            HStack {
                Image(systemName: "sparkles")
                Text("Jeres tur")
                    .font(.headline)
                Spacer()
                Text("\(promptIndex + 1) / \(game.prompts.count)")
                    .font(.subheadline.monospacedDigit())
            }

            Text(game.prompts[promptIndex % game.prompts.count])
                .font(.system(size: 30, weight: .bold))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, minHeight: 200)
                .padding(22)
                .background(Color.gatherPaper)
                .clipShape(RoundedRectangle(cornerRadius: 24))

            Button {
                promptIndex += 1
            } label: {
                Text("Næste kort")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.gatherPaper)
                    .background(Color.gatherEspresso)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }

            Button {
                hasStarted = false
                promptIndex = 0
            } label: {
                Text("Se regler igen")
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .foregroundStyle(Color.gatherEspresso)
        }
    }
}
