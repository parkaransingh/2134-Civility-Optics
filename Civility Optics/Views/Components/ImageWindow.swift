//
//  ImageWindow.swift
//  Civility Optics
//
//  Created by William Silva on 9/9/22
//

import SwiftUI
import Combine

extension String {
    func load() -> UIImage {
        
        do {
            
            guard let url = URL(string:self)
            else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}
struct ImageWindow: View {
    var body: some View {
        Image(uiImage: "https://cdn.cnn.com/cnnnext/dam/assets/200705124004-georgia-tech-campus-super-tease.jpg".load()).resizable().frame(width: 300, height: 200)
        
    }
}

struct ImageWindow_Preview  :
    PreviewProvider {
        static var previews: some View {
            ImageWindow()
        }
    }
