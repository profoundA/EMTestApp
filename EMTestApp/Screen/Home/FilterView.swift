//
//  FilterView.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 04.09.2022.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var price: String = "All prices"
    @State var brandName: String = "All brands"
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.ecColor(.blue))
                        .frame(width: 37, height: 37)
                        .overlay { Image("Close") }
                }.padding(.leading, 30)
                Text("Filter Options")
                    .font(Font.markpro(.medium, size: 18))
                    .padding(.leading, 57)
                    .padding(.trailing, 20)
                Spacer()
                Button(action: {dismiss()}) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.ecColor(.orange))
                        .frame(width: 86, height: 37)
                        .overlay {
                            Text("Done")
                                .font(Font.markpro(.medium, size: 18))
                                .foregroundColor(.white)
                        }
                }
                Spacer()
            }
            .padding([.bottom, .top])
            
            VStack(alignment: .leading) {
                Text("Brand")
                    .font(Font.markpro(.medium, size: 18))
                Menu {
                    Button("All brands") {
                        brandName = "All brands"
                    }
                    Button("Samsung") {
                        brandName = "Samsung"
                    }
                    Button("Xiaomi") {
                        brandName = "Xiaomi"
                    }
                    Button("Motorola") {
                        brandName = "Motorola"
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 337, height: 37)
                        .overlay {
                            HStack {
                                Text(brandName)
                                    .font(Font.markpro(.regular, size: 18))
                                    .frame(width: 200, alignment: .leading)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                Spacer()
                                    .frame(maxWidth: 200)
                                Image("DownArrow")
                                    .padding(.horizontal,20)
                            }
                        }
                }
            }.padding(.bottom)
            VStack(alignment: .leading) {
                Text("Price")
                    .font(Font.markpro(.medium, size: 18))
                Menu {
                    
                    Button("All prices") {
                        price = "All prices"
                    }
                    Button("$0 - $500", action: {
                        price = "$0 - $500"
                    })
                    Button("$500 - $1500", action: {
                        price = "$500 - $1500"
                    })
                    Button("$1500 - $5000", action: {
                        price = "$1500 - $5000"
                    })
                    Button("$5000 - $10000", action: {
                        price = "$5000 - $10000"
                    })

                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 337, height: 37)
                        .overlay {
                            HStack {
                                Text(price)
                                    
                                    .frame(width: 200, alignment: .leading)
                                    .font(Font.markpro(.regular, size: 18))
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    
                                    
                                Spacer()
                                    .frame(maxWidth: 200)
                                Image("DownArrow")
                                    .padding(.horizontal,20)
                                
                            }
                        }
                }
            }.padding(.bottom)
            VStack(alignment: .leading) {
                Text("Size")
                    .font(Font.markpro(.medium, size: 18))
                Menu {} label: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 337, height: 37)
                        .overlay {
                            HStack {
                                Text("4.5 to 5.5 inches")
                                    .font(Font.markpro(.regular, size: 18))
                                .foregroundColor(.black)
                                Spacer()
                                    .frame(minWidth: 50, maxWidth: 150)
                                Image("DownArrow")
                                
                            }
                        }
                }
            }
            
            Spacer()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
