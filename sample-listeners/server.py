#!/usr/bin/env python3
import os
import http.server as server
import socketserver as SocketServer
import logging

PORT = int(os.environ.get('PORT'))

print('port', PORT)

class GetHandler(server.SimpleHTTPRequestHandler):

    def do_GET(self):
        with open(f'./logs-{PORT}', 'w') as file:
            file.write(f'got request! {self.address_string}')
            file.close()
        server.SimpleHTTPRequestHandler.do_GET(self)


Handler = GetHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)

httpd.serve_forever()