//
//  AlbumCellView.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import SwiftUI

struct AlbumCellViewNavigation: View {
    var album: Album
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                TrackListView(album: album)
                
            } label: {
                AlbumCellView(album: album)
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    AlbumCellViewNavigation(album: Album(id: "0", name: "albumName", artistName: "artistName", image: "https://eng.skillbox.ru/_next/image?url=https%3A%2F%2Fwanting-tested-vessel.media.strapiapp.com%2FAD_4n_Xe1ia8_Ilyz_Hb9_Ghy_Kp18_Qo_Ts_R_Nciwxx_Qr9_VQ_Ri_Iv_P_Bk59_Mtc_N_9m7_Ng_Jg7_SM_3is9_ANOF_9_Tc6x5_R_mtkj_Em7_P_3_B3_Ivz_Ay_V_Dzm_T2_KTJMUOF_Cw_Kj_Th_Qjt77t_f039df036e.jpg&w=1920&q=75", tracks: []))
}
