import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatus extends StatefulWidget {
  final void Function(bool)? checkConnection;

  ConnectionStatus({this.checkConnection, Key? key}) : super(key: key);

  @override
  State<ConnectionStatus> createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  late Stream<List<ConnectivityResult>> _connectivityStream;
  String _status = "Checking...";
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    _isConnected = false;
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      _status = "Connected";
      _isConnected = true;
    } else {
      _status = "No Connection";
      _isConnected = false;
    }
    if (widget.checkConnection != null) widget.checkConnection!(_isConnected);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: _connectivityStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _updateStatus(snapshot.data!);
        }

        return Visibility(
          visible: !_isConnected,
          child: Container(
            color: Colors.black,
            height: 30,
            width: double.infinity,
            child: Center(
              child: Text(
                _status,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
