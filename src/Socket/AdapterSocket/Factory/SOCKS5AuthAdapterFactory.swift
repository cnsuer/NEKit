//
//  SOCKS5AuthAdapterFactory.swift
//  PacketTunnel
//
//  Created by restver on 2021/08/09.
//

import Foundation

public class SOCKS5AuthAdapterFactory: ServerAdapterFactory {
    
    let username: String
    let password: String
    
    public init(serverHost: String, serverPort: Int, username: String, password: String) {
        self.username = username
        self.password = password
        super.init(serverHost: serverHost, serverPort: serverPort)
    }

    override open func getAdapterFor(session: ConnectSession) -> AdapterSocket {
        let adapter = SOCKS5AuthAdapter(serverHost: serverHost, serverPort: serverPort, username: username, password: password)
        adapter.socket = RawSocketFactory.getRawSocket()
        return adapter
    }
}
