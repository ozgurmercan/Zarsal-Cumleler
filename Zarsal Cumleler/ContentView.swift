//
//  ContentView.swift
//  Zarsal Cumleler
//
//  Created by Özgür Mercan on 11.04.2023.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @State var zar1 = 0 // 2 tane zar değişkeni oluşturduk
    @State var zar2 = 0 // Uygulama açıldığında zarlar gözükmesin diye değerleri 0
    @State var rotateZar = false // Zarları döndürmek için değişken
    
    let zarSallama = CMMotionManager() // Sallanma hareketini bildiren nesne
    
    var zarDurumu: String {
        
        // Gelen zarlara göre ekrana gelecek cümleleri belirliyoruz.
        switch (zar1, zar2) {
        case (1, 1):
            return "(Hep Yek) -Tavla tahtası üzerinde, zarlar çıktı yek, Hareket eden ben tek, rakibim kaldı bekleyerek."
        case (2, 2):
            return "(Dü Bara) - Oyun Gitti Bağıra Bağıra"
        case (3, 3):
            return "(Dü Se) - "
        case (4, 4):
            return "(Dört Çar) - Tavla masasında, zarlar döner durur, benim zarımda kaybetmek diye bir şey yoktur."
        case (5, 5):
            return "(Dü beş) - "
        case (6, 6):
            return "(Dü Şeş) - "
        case (4, 2):
            return "(Cihar-i Dü) - "
        case (2, 4):
            return "(Cihar-i Dü) - "
        case (6, 5):
            return "(Şeş Beş) - "
        case (5, 6):
            return "(Şeş Beş) - "
        case (6, 4):
            return "(Şeş-i Yek) - "
        case (4, 6):
            return "(Şeş-i Yek) - "
        case (3, 5):
            return "(Penc-ü Se) - Severler güzeli gencüse"
        case (5, 3):
            return "(Penc-ü Se) - Severler güzeli gencüse"
        case (6, 3):
            return "(Şeş-ü Se) - "
        case (3, 6):
            return "(Şeş-ü Se) - "
        case (2, 1):
            return "(Yek-i Dü) - "
        case (1, 2):
            return "(Yek-i Dü) - "
        case (1, 3):
            return "(Se yek) - "
        case (3, 1):
            return "(Se yek) - "
        case (1, 5):
            return "(Penc-i Yek) - "
        case (5, 1):
            return "(Penc-i Yek) - "
        case (4, 1):
            return "(Cihar-ı Yek) - "
        case (1, 4):
            return "(Cihar-ı Yek) - "
        case (6, 1):
            return "(Şeş-i Yek) - "
        case (1, 6):
            return "(Şeş-i Yek) - "
        case (3, 2):
            return "(Seba-i Dü) - "
        case (2, 3):
            return "(Seba-i Dü) - "
        case (2, 6):
            return "(Seba-i Dü) - İki zar, altı yüz, şansın gözleri, Tavla masasında ağlar, kaybedenin gözleri"
        case (6, 2):
            return "(Seba-i Dü) - İki zar, altı yüz, şansın yüzleri, Tavla masasında ağlar, kaybedenin yüzleri"
        case (2, 5):
            return "(Penc-i Dü) - "
        case (5, 2):
            return "(Penc-i Dü) - "
        case (5, 4):
            return "(Penc-i Dü) - "
        case (4, 5):
            return "(Penc-i Dü) - "
        case (4, 3):
            return "(Cihar-ü Se) - "
        case (3, 4):
            return "(Cihar-ü Se) - "
        default:
            return "Salla Gelsin"
        }
    }
    var body: some View {
        VStack {
            VStack {
                Text(zarDurumu)
                    .font(.headline)
                    .padding()
                HStack {
                    ZarView(zarSayisi: zar1) // Zar1 dönme animasyonu
                        .rotationEffect(.degrees(rotateZar ? 360 : 0))
                        .animation(.easeInOut(duration: 0.7)) // Zar1 dönüş süresi
                    ZarView(zarSayisi: zar2) // Zar2 dönme animasyonu
                        .rotationEffect(.degrees(rotateZar ? 360 : 0))
                        .animation(.easeInOut(duration: 0.7)) // Zar2 dönüş süresi
                }
                Button("Zar At") {
                    withAnimation  {
                        rotateZar.toggle()
                        zar1 = Int.random(in: 1...6) // Zar1 için 1-6 (1 ve 6 dahil) arasında rasgele integer sayılar oluşturmasını istiyoruz.
                        zar2 = Int.random(in: 1...6) // Zar2 için 1-6 (1 ve 6 dahil) arasında rasgele integer sayılar oluşturmasını istiyoruz.
                    }
                }
            }
        }
        .onAppear() {
            zarSallama.startAccelerometerUpdates(to: .main) { data, error in
                guard let data = data else { return }
                
                if abs(data.acceleration.x) > 3 || abs(data.acceleration.y) > 3 || abs(data.acceleration.z) > 3 {
                    withAnimation  {
                        rotateZar.toggle()
                        zar1 = Int.random(in: 1...6)
                        zar2 = Int.random(in: 1...6)
                    }
                }
            }
        }
    }
}
struct ZarView: View {
    var zarSayisi: Int
    
    var body: some View {
        Image(systemName: "die.face.\(zarSayisi).fill") // Apple SF sembollerinden bir zar görünümü alındı
            .font(.system(size: 100)) // Boyutu belirlendi
            .padding(5) // Zarlar arasına boşluk eklendi.
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

