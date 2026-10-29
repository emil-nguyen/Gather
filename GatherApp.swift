
import SwiftUI

@main
struct GatherApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

struct HomeView: View {
    let cream = Color(red: 243/255, green: 233/255, blue: 216/255)
    let espresso = Color(red: 75/255, green: 48/255, blue: 39/255)

    let categories = [
        "Kaos og bluff",
        "Grin og udfordringer",
        "Venskab og dilemmaer",
        "Ord og gæt",
        "Flirt og spicy",
        "Strategi og mysterier"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                cream.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("gather.")
                            .font(.system(size: 42, weight: .bold))
                            .foregroundStyle(espresso)

                        Text("Good friends. Great games.")
                            .font(.title3)
                            .foregroundStyle(espresso.opacity(0.7))

                        Text("Vælg jeres stemning")
                            .font(.title2.bold())
                            .foregroundStyle(espresso)

                        ForEach(categories, id: \.self) { category in
                            NavigationLink {
                                GameView(category: category)
                            } label: {
                                HStack {
                                    Text(category)
                                        .font(.headline)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                }
                                .foregroundStyle(cream)
                                .padding()
                                .background(espresso)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 18)
                                )
                            }
                        }
                    }
                    .padding(24)
                }
            }
        }
        .tint(espresso)
    }
}

struct GameView: View {
    let category: String

    var body: some View {
        ZStack {
            Color(red: 243/255, green: 233/255, blue: 216/255)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text(category)
                    .font(.largeTitle.bold())

                Text("Saml vennerne, og gør jer klar til at spille!")

                Text("Flere spil kommer snart.")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }
}
