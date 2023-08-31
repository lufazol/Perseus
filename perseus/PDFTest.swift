//
//  PDFTest.swift
//  perseus
//
//  Created by Cassiano C Salgado on 30/08/23.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
struct PDFTestView: View {
    
    let altura = 3508.0
    let largura = 2480.0
    
    @State var selectedItems: [PhotosPickerItem] = []

    // set lists used on pickers
    let tiposSanguineos = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    let sexos = ["Masculino", "Feminino", "Outro", "Não declarar"]
    var currentValue: Float = 0.0
    var weightArray:[String] = []

    //loop for weight values
    init() {
        while currentValue <= 500.0 {
            weightArray.append(String(format: "%.1f", currentValue))
            currentValue += 0.5
        }
    }

    @Environment(\.editMode) private var editMode
    
    @ObservedObject
    private var elder: Elder = GlobalElder.shared.mockedElder


    
    var body: some View {
        ShareLink("Export PDF", item: render())
    }

    func render() -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
           BoletinsView()
        )

        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "ficha_medica.pdf")

        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }

            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)

            // 7: Render the SwiftUI view data onto the page
            context(pdf)

            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }

        return url
    }
}



struct PDFTestView_Previews: PreviewProvider {
    static var previews: some View {
        PDFTestView()
    }
}
