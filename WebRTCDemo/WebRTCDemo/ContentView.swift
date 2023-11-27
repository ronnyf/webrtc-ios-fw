//
//  ContentView.swift
//  WebRTCDemo
//
//  Created by Falk, Ronny on 7/27/23.
//
//  Copyright 2023 The WebRTC Project Authors. All rights reserved.
//
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file in the root of the source
//  tree. An additional intellectual property rights grant can be found
//  in the file PATENTS.  All contributing project authors may
//  be found in the AUTHORS file in the root of the source tree.

import SwiftUI
import WebRTC

struct ContentView: View {

	@StateObject var viewModel = ViewModel()
	
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
			Button("audio config") {
				try! viewModel.audioSessionConfiguration()
			}
        }
        .padding()
    }
}

class ViewModel: ObservableObject {

	func connectionFactory() {
		let pcf = RTCPeerConnectionFactory(encoderFactory: RTCDefaultVideoEncoderFactory(), decoderFactory: RTCDefaultVideoDecoderFactory())
		let pc = pcf.peerConnection(with: RTCConfiguration(), constraints: RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil), delegate: nil)
	}
	
	func audioSessionConfiguration() throws {
		let configuration = RTCAudioSessionConfiguration.webRTC()
		configuration.category = AVAudioSession.Category.playAndRecord.rawValue
		configuration.mode = AVAudioSession.Mode.videoChat.rawValue
		configuration.categoryOptions = [.allowBluetooth, .allowBluetoothA2DP]
		
		// configure session
		let session = RTCAudioSession.sharedInstance()
		session.lockForConfiguration()
		defer {
			session.unlockForConfiguration()
		}
		try session.setConfiguration(configuration, active: true)
		print("OH OH")
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
