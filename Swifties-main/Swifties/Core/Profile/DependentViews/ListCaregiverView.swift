//
//  ListCaregiverView.swift
//  Swifties
//
//  Created by Pavneet Cheema on 4/20/24.
//

import SwiftUI

struct ListCaregiverView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    ForEach(viewModel.listofCaregiver){ user in
                        HStack{
                            Text(user.initialis)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 62)
                                .background(Color(.systemGray3))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.trailing, 10)
                            Text(user.fullName)
                                .foregroundColor(.black)
                            Spacer()
                        }.padding(.horizontal)
                        Divider().padding(.vertical, 8)
                    }
             
                }
//                VStack{
//                    Spacer()
//                    Button{
//                        //viewModel.listofCaregiver = []
//                        Task{
//                            //viewModel.listofCaregiver = []
//                            await viewModel.fetchUser()
//                        }
//                    } label: {
//                        Image(systemName: "arrow.clockwise")
//                    }
//                    .frame(width: 60, height: 50)
//                    .foregroundColor(.white)
//                    .background(.ablue)
//                    .cornerRadius(40)
//                    .padding(.bottom, 40)
//                }
            }
            .navigationTitle("Caregivers")
        }
    }
}

#Preview {
    ListCaregiverView()
}
