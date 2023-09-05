import SwiftUI

struct GenerateChips: View {
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = createGroupedItems(items)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 55) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
        }
        
        groupedItems.append(tempItems)
        return groupedItems
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(groupedItems, id: \.self) { subItems in
                    HStack {
                        ForEach(subItems, id: \.self) { word in
                            Text(word)
                                .font(.system(size: 15))
                                .fixedSize()
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color("backgroundColor"))
                                .foregroundColor(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct GenerateChips_Previews: PreviewProvider {
    static var previews: some View {
        GenerateChips(items: ["Первый","ВторойВторой","Третий","Четвертый"])
    }
}
