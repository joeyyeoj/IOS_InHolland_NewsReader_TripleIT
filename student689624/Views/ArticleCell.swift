//
//  ArticleCell.swift
//  student689624
//
//  Created by user206790 on 10/14/21.
//

import SwiftUI
import URLImage

struct ArticleCell: View {
    let article: Article
    
    
    var body: some View {
        HStack{
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
                    case 1: Image(systemName: "newspaper").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    case 2: Image(systemName: "network").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        case 3: Image(systemName: "sportscourt").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        case 4: Image(systemName: "questionmark.square").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        case 5: Image(systemName: "gamecontroller").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        case 6: Image(systemName: "brain.head.profile").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    default:
                        //moest een default kiezen en vond het lievenheersbeestje wel schattig
                        Image(systemName: "ladybug")
                    }
                }
                
                failure: { error, _ in
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(width: 100, height: 100)
                }
                
                content: {
                    image in image.resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).cornerRadius(10)
                }
                         
            }
            else{
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
            }
            
            Text(article.title)
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: Article.dummyData).previewLayout(.sizeThatFits)
    }
}
