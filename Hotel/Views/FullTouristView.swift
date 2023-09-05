import SwiftUI

struct FullTouristView: View {
    @EnvironmentObject var viewModel: ViewModel
    let index: Int
    
    @State var nameTourist = ""
    @State var secNameTourist = ""
    @State var birthdayTourist = ""
    @State var passportTourist = ""
    @State var validityPeriodTourist = ""
    @State var nationTourist = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("\(viewModel.nameTourist[index]) турист")
                    .font(.system(size: 20, weight: .bold))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                Spacer()
                Button {
                    viewModel.tourists[index] = false
                } label: {
                    Image("blueArrowTop")
                        .resizable()
                        .frame(width: 20, height: 10)
                }
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color("lightBlue"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            VStack(alignment: .leading) {
                Text("Имя")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $nameTourist)
                    .onChange(of: nameTourist, perform: { (value) in
                        if index == 0 {
                            if nameTourist != "" {
                                viewModel.nameFill = true
                            } else {
                                viewModel.nameFill = false
                            }
                        }
                    })
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.nameFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Фамилия")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $secNameTourist)
                    .onChange(of: secNameTourist, perform: { (value) in
                        if index == 0 {
                            if secNameTourist != "" {
                                viewModel.secNameFill = true
                            } else {
                                viewModel.secNameFill = false
                            }
                        }
                    })
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.secNameFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Дата рождения")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $birthdayTourist)
                    .onChange(of: birthdayTourist, perform: { (value) in
                        if index == 0 {
                            if birthdayTourist != "" {
                                viewModel.birthdayFill = true
                            } else {
                                viewModel.birthdayFill = false
                            }
                        }
                    })
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.birthdayFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Гражданство")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $nationTourist)
                    .onChange(of: nationTourist, perform: { (value) in
                        if index == 0 {
                            if nationTourist != "" {
                                viewModel.nationFill = true
                            } else {
                                viewModel.nationFill = false
                            }
                        }
                    })
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.nationFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Номер загранпаспорта")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $passportTourist)
                    .onChange(of: passportTourist, perform: { (value) in
                        if index == 0 {
                            if passportTourist != "" {
                                viewModel.passportFill = true
                            } else {
                                viewModel.passportFill = false
                            }
                        }
                    })
                    .keyboardType(.numberPad)
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.passportFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Срок действия загранпаспорта")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))

                TextField("", text: $validityPeriodTourist)
                    .onChange(of: validityPeriodTourist, perform: { (value) in
                        if index == 0 {
                            if validityPeriodTourist != "" {
                                viewModel.validityPeriodFill = true
                            } else {
                                viewModel.validityPeriodFill = false
                            }
                        }
                    })
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .background(
                (viewModel.validityPeriodFill == false && index == 0)
                ? Color("redErrorColor") : Color("backgroundColor")
            )
            .cornerRadius(10)
        }
        
    }
}

struct FullTouristView_Previews: PreviewProvider {
    static var previews: some View {
        FullTouristView(index: 0)
            .environmentObject(ViewModel())
    }
}
