import SwiftUI

struct CellCollapsedTouristView: View {
    @EnvironmentObject var viewModel: ViewModel
    let index: Int
    
    var body: some View {
        HStack {
            Text("\(viewModel.nameTourist[index]) турист")
                .font(.system(size: 20, weight: .bold))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            Spacer()
            Button {
                viewModel.tourists[index] = true
            } label: {
                Image("blueArrowBottom")
                    .resizable()
                    .frame(width: 20, height: 10)
            }
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .background(Color("lightBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

struct CellCollapsedTouristView_Previews: PreviewProvider {
    static var previews: some View {
        CellCollapsedTouristView(index: 0)
            .environmentObject(ViewModel())
    }
}
