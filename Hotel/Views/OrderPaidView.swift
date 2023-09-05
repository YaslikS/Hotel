import SwiftUI

struct OrderPaidView: View {
    @Environment(\.dismiss) private var dismiss
    let randomInt = Int.random(in: 100000..<1000000)
    
    var body: some View {
        VStack {
            Image("partyPopperPic")
                .resizable()
                .frame(width: 88, height: 88)
            
            Text("Ваш заказ принят в работу")
                .multilineTextAlignment(.center)
                .padding()
                .bold()
                .font(.system(size: 20))
            
            Text(verbatim:
                "Подтверждение заказа №\(randomInt) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
            )
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .navigationTitle("Заказ оплачен")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack{
                    Button("Супер!"){
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .frame(width: 365, height: 45)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct OrderPaidView_Previews: PreviewProvider {
    static var previews: some View {
        OrderPaidView()
    }
}
