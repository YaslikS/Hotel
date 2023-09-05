import SwiftUI

struct BookingView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var phoneBuyer = ""
    @State var phoneFill = false
    
    @State var emailBuyer = ""
    @State var emailFill = false
    
    @State private var showingAlert = false
    
    var body: some View {
        List {
            // Основные данные про отель
            Section {
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("lightYellow"))
                        .frame(width: 170, height: 30)
                        .overlay(
                            HStack {
                                Image("goldStar")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Text(String(viewModel.booking?.horating ?? 0))
                                    .foregroundColor(.yellow)
                                Text(viewModel.booking?.rating_name ?? "")
                                    .foregroundColor(.yellow)
                            }
                        )
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    Text(viewModel.booking?.hotel_name ?? "")
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 25))
                    
                    Button {
                        print("Button clicked")
                    } label: {
                        Text(viewModel.booking?.hotel_adress ?? "")
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .font(.system(size: 15))
                    }.padding(EdgeInsets(top: 1, leading: 0, bottom: 10, trailing: 0))
                }
            }
            
            // Данные брони
            Section {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Вылет из")
                        Spacer()
                        Text(viewModel.booking?.departure ?? "")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Страна, город")
                        Spacer()
                        Text(viewModel.booking?.arrival_country ?? "")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Даты")
                        Spacer()
                        Text("\(viewModel.booking?.tour_date_start ?? "") - \(viewModel.booking?.tour_date_stop ?? "")")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack (alignment: .top){
                        Text("Кол-во ночей")
                        Spacer()
                        Text(String(viewModel.booking?.number_of_nights ?? 0) + " ночей")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Отель")
                        Spacer()
                        Text(viewModel.booking?.hotel_name ?? "")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Номер")
                        Spacer()
                        Text(viewModel.booking?.room ?? "")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Питание")
                        Spacer()
                        Text(viewModel.booking?.nutrition ?? "")
                            .frame(width: 200, alignment: .topLeading)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                }
            }
            
            // Информация о покупателе
            Section {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Информация о покупателе")
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 25))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0))
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Номер телефона")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        
                        TextField("", text: $phoneBuyer)
                            .onChange(of: phoneBuyer) {
                                phoneBuyer = $0.formatMobileNumber().number
                                if $0.formatMobileNumber().count < 11 {
                                    phoneFill = false
                                } else {
                                    phoneFill = true
                                }
                            }
                            .keyboardType(.numberPad)
                            .font(.system(size: 20))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                    .background(phoneFill == false ? Color("redErrorColor") : Color("backgroundColor"))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("Почта")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        TextField("", text: $emailBuyer)
                            .onChange(of: emailBuyer) {
                                emailFill = invalidEmail(email: $0)
                            }
                            .font(.system(size: 20))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    .background(emailFill == false ? Color("redErrorColor") : Color("backgroundColor"))
                    .cornerRadius(10)
                    
                    Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(EdgeInsets(top: 3, leading: 0, bottom: 10, trailing: 0))
                }
            }
            
            Section {
                ForEach(0...viewModel.tourists.count - 1, id: \.self) { index in
                    if viewModel.tourists[index] == false {
                        CollapsedTouristView(index: index)
                    } else {
                        FullTouristView(index: index)
                    }
                }
                
                HStack {
                    Text("Добавить туриста")
                        .font(.system(size: 20, weight: .bold))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    Spacer()
                    Button {
                        if viewModel.tourists.count < 10 {
                            viewModel.tourists.append(false)
                        } else {
                            showingAlert = true
                        }
                    } label: {
                        Image("whitePlus")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        viewModel.tourists.count < 10 ? Color.blue : Color("redErrorColor")
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .alert("Можно добавить максимум 10 туристов", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
            
            Section {
                VStack{
                    HStack(alignment: .top) {
                        Text("Тур")
                        Spacer()
                        Text(String(viewModel.booking?.tour_price ?? 0) + " ₽")
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Топливный сбор")
                        Spacer()
                        Text(String(viewModel.booking?.fuel_charge ?? 0) + " ₽")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack(alignment: .top) {
                        Text("Сервисный сбор")
                        Spacer()
                        Text(String(viewModel.booking?.service_charge ?? 0) + " ₽")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack (alignment: .top){
                        Text("К оплате")
                        Spacer()
                        Text(String(viewModel.fullPrice ?? 0) + " ₽")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
            }
        }
        .padding(.horizontal, -17.0)
        .background(Color("backgroundColor"))
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if (
                emailFill && phoneFill && viewModel.nameFill && viewModel.nationFill
                && viewModel.birthdayFill && viewModel.passportFill
                && viewModel.secNameFill && viewModel.validityPeriodFill
            ){
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        NavigationLink {
                            OrderPaidView()
                        } label: {
                            Text("Оплатить \(String(viewModel.fullPrice ?? 0)) ₽")
                        }
                        .foregroundColor(.white)
                        .frame(width: 365, height: 45)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.getBooking()
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
            .environmentObject(ViewModel())
    }
}
