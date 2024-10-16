//
//  ReachabilityWrapper.swift
//  StarterApp
//
//  Created by Mina Yousry on 03/01/2023.
//

import Foundation
import Reachability
import RxSwift

class ReachabilityWrapper {
    
    private let reachability = try? Reachability()
    private init() {
        self.startMonitoringNetworkChanges()
    }
    
    static let shared = ReachabilityWrapper()
    let connection = BehaviorSubject<Reachability.Connection>(value: .cellular)
    
    private func startMonitoringNetworkChanges() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            self.connection.onNext(.unavailable)
        }
    }
    
    @objc private func reachabilityChanged(notification: Notification) {
        guard let reachability = notification.object as? Reachability else { return }
        self.connection.onNext(reachability.connection)
    }
}
