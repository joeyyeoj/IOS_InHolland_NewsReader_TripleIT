//
//  ArticleDetail.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI
import URLImage

struct ArticleDetail: View {
    let article: Article
    
    
    var body: some View {
        let splitDate = article.publishDate.split(separator: "T")
        let time = String(splitDate[1])
        let date = String(splitDate[0])
    
        ScrollView{
            VStack(alignment: .leading){
                if let imgUrl = article.image,
                   let url = URL(string: imgUrl){
                    
                    URLImage(url){
                        switch article.feed{
                            case 1: Image(systemName: "newspaper")
                            case 2: Image(systemName: "network")
                            case 3: Image(systemName: "sportscourt")
                            case 4: Image(systemName: "questionmark.square")
                            case 5: Image(systemName: "gamecontroller")
                            case 6: Image(systemName: "brain.head.profile")
                        default:
                            //moest een default kiezen en vond het lievenheersbeestje wel schattig
                            Image(systemName: "ladybug")
                        }
                    }
                    inProgress: {
                        progress in
                        switch article.feed{
                        case 1: Image(systemName: "newspaper").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                        case 2: Image(systemName: "network").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                            case 3: Image(systemName: "sportscourt").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                            case 4: Image(systemName: "questionmark.square").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                        case 5: Image(systemName: "gamecontroller").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                            case 6: Image(systemName: "brain.head.profile").resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350)
                        default:
                            //moest een default kiezen en vond het lievenheersbeestje wel schattig
                            Image(systemName: "ladybug")
                        }
                    }
                    
                    failure: { error, _ in
                        Image(systemName: "photo.fill")
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .frame(maxWidth: .infinity, maxHeight: 350)
                    }
                    
                    content: {
                        image in image.resizable().aspectRatio(contentMode: .fill).frame(maxWidth: .infinity, maxHeight: 350).cornerRadius(1)
                    }
                             
                }
                else{
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                }
                
                
                VStack(alignment: .leading){
                    Text("Gepubliceerd op \(date) om \(time)").font(.caption)
                    Text(article.title).font(.title2).padding(.vertical, 4)
                    Text(article.summary)
                    HStack{
                        if(!article.isLiked){
                            Button("Like"){
                                
                            }.padding(.vertical, 12)
                                .padding(.horizontal, 30)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .heavy))
                                .cornerRadius(10)
                        }
                        else{
                            Button("Unlike"){
                                
                            }.padding(.vertical, 12)
                                .padding(.horizontal, 30)
                                .background(Color.white)
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .heavy))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).fill(Color.red))
                        }
                        
                        Button("Delen"){
                            
                        }.padding(.vertical, 12).padding(.horizontal, 30).background(Color.blue).foregroundColor(.white).font(.system(size: 15, weight: .heavy)).cornerRadius(10)
                        
                        Button("Lezen"){
                            
                        }.padding(.vertical, 12).padding(.horizontal, 30).background(Color.purple).foregroundColor(.white).font(.system(size: 15, weight: .heavy)).cornerRadius(10)
                        
                        
                    }.padding(.vertical, 8)
                }.padding(.leading, 20)
            }
            
        }
        
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: Article.dummyData)
    }
}
