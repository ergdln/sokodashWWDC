import SwiftUI




@main
struct MyApp: App {
    
    @State var listOfTiles = Tiles().listOfTiles
    @State var startPosition: Int = 19
    
    let columns = [
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
    ]
    
    func defineMoviment(actualPosition: Int, offset: Int){
        if listOfTiles[actualPosition + offset] == "x" {
            listOfTiles.swapAt(actualPosition + offset, actualPosition)
            startPosition = actualPosition + offset
        }
        else if listOfTiles[startPosition + offset] == "w" {
            if listOfTiles[actualPosition + offset + offset] != "b"{
                listOfTiles[actualPosition] = "x"
                listOfTiles[actualPosition + offset] = "m"
                listOfTiles[actualPosition + offset + offset] = "w"
                startPosition = actualPosition + offset
            }
        }
        else{
            print("nao consigo me mover")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack{
//                Image("bg")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack(alignment: .center, spacing: 0){
                    LazyVGrid(columns: columns, spacing: 0){
                        ForEach((0...listOfTiles.count-1), id: \.self) { num in
                            
                            if listOfTiles[num] == "b"{
                                Image("tijolo")
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(5)
                            }
                            else if listOfTiles[num] == "x"{
                                Image("grama")
                                    .resizable()
                                    .scaledToFill()
                            }
                            else if listOfTiles[num] == "y"{
                                Circle().foregroundColor(.yellow)
                            }
                            else if listOfTiles[num] == "w"{
                                Circle().foregroundColor(.blue)
                                
                            }
                            else if listOfTiles[num] == "m"{
                                Circle().foregroundColor(.red)
                                
                            }
                        }
                    }
                    
                    Button("Direita"){
                        defineMoviment(actualPosition: startPosition, offset: 1)
                        defineMoviment(actualPosition: startPosition, offset: 1)

                    }
                    
                    Button("Esquerda"){
                        defineMoviment(actualPosition: startPosition, offset: -1)
                    }
                    
                    Button("Cima"){
                        defineMoviment(actualPosition: startPosition, offset: -8)
                    }
                    
                    Button("Baixo"){
                       defineMoviment(actualPosition: startPosition, offset: +8)
                    }
                }
            }
        }
    }
}
