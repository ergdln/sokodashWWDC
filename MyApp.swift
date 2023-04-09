import SwiftUI




@main
struct MyApp: App {
    
    //Import the game map
    @State var levelListOfTiles = Level2().level2Map
    
    //Import game map dimensions
    let levelColumns = Level2().level2Grid
    
    //Import the star position in the map
    @State var startPosition: Int = Level2().level2StartPosition
    
    //Import the offset to move up and down
    let levelOffset = Level2().upDownOffset
    
    
    @State var endGameText: String = "voce ainda nao venceu"
    
    //Rename de map elements
    let box: String = "📦"
    let grass: String = "⬜️"
    let person: String = "🙋🏿"
    let wall: String = "⬛️"
    let place: String = "🟨"
    
    
    
//MARK: main game function
    
    func defineMoviment(actualPosition: Int, offset: Int){
        //walking in free space
        if levelListOfTiles[actualPosition + offset] == grass {
            levelListOfTiles.swapAt(actualPosition + offset, actualPosition)
            startPosition = actualPosition + offset
            defineMoviment(actualPosition: startPosition, offset: offset)
        }
        //pushing a box
        else if levelListOfTiles[startPosition + offset] == box {
            if levelListOfTiles[actualPosition + offset + offset] != wall && levelListOfTiles[actualPosition + offset + offset] != box{
                levelListOfTiles[actualPosition] = grass
                levelListOfTiles[actualPosition + offset] = person
                levelListOfTiles[actualPosition + offset + offset] = box
                startPosition = actualPosition + offset
            }
        }
        else{
            print("nao consigo me mover")
        }
       // isLevelCompleted(platesPosition: <#T##[Int]#>)
    }
    
//MARK: checking if the level is completed
    
    func isLevelCompleted(platesPosition: [Int]){
        if (platesPosition.allSatisfy{levelListOfTiles[$0] == box}){
            endGameText = "voce venceu"
        }
    }
    
//MARK: bulding the interface
    
    var body: some Scene {
        WindowGroup {
                VStack(alignment: .center, spacing: 0){
                    LazyVGrid(columns: levelColumns, spacing: 0){
                        ForEach((0...levelListOfTiles.count-1), id: \.self) { num in
                            
                            if levelListOfTiles[num] == wall{
                                Image("tijolo")
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(5)
                            }
                            else if levelListOfTiles[num] == grass{
                                Image("grama")
                                    .resizable()
                                    .scaledToFill()
                            }
                            else if levelListOfTiles[num] == place{
                                Circle().foregroundColor(.yellow)
                            }
                            else if levelListOfTiles[num] == box{
                                Circle().foregroundColor(.blue)
                                
                            }
                            else if levelListOfTiles[num] == person{
                                Circle().foregroundColor(.red)
                                
                            }
                        }
                    }
//MARK: game controls
                    
                    Button("Direita"){
                        defineMoviment(actualPosition: startPosition, offset: 1)

                    }
                    
                    Button("Esquerda"){
                        defineMoviment(actualPosition: startPosition, offset: -1)
                    }
                    
                    Button("Cima"){
                        defineMoviment(actualPosition: startPosition, offset: levelOffset * -1)
                    }
                    
                    Button("Baixo"){
                       defineMoviment(actualPosition: startPosition, offset: levelOffset)
                    }
                    Button("Refresh"){
                    levelListOfTiles = Level2().level2Map
                    startPosition = 13
                    }
                    Text(endGameText)
                }//.padding(30)
            }
    }
}
