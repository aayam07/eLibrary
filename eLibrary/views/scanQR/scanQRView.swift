//
//  scanQRView.swift
//  eLibrary
//
//  Created by Sabal on 10/20/22.
//

import SwiftUI
import CodeScanner

struct scanQRView: View {
    @State private var isPresentingScanner = false
    @State var scannedResult:String = "Scan result will appear here"
    
    var scannerSheet: some View{
        CodeScannerView(codeTypes: [.qr],
                        completion: { result in
            if case let .success(code) = result{
                self.scannedResult = code.string
                self.isPresentingScanner = false
            }
            
        })
    }
    
    
    
    var body: some View {
        VStack {
        
            
            Text(scannedResult)
                .foregroundColor(Color.theme.accent)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.theme.secondaryText)
                        
                )
                .frame(width: 350, height: 40)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
            
            scannerSheet
        }
    }
}

struct scanQRView_Previews: PreviewProvider {
    static var previews: some View {
        scanQRView()
    }
}
