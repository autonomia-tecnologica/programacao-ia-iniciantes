"""Static file server for the course: serves a folder on port 8080.

Usage: python3 serve.py [folder]   (default: the folder this file is in)
"""
import functools
import http.server
import os
import socketserver
import sys

PORT = 8080
ROOT = sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.abspath(__file__))


class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        # Cross-origin isolation, needed by threaded Godot web exports.
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        super().end_headers()


socketserver.ThreadingTCPServer.allow_reuse_address = True
handler = functools.partial(Handler, directory=ROOT)
with socketserver.ThreadingTCPServer(("0.0.0.0", PORT), handler) as httpd:
    httpd.serve_forever()
