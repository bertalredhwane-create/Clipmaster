import os
import subprocess
from flask import Flask, request, jsonify, send_file
from flask_cors import CORS
import yt_dlp

app = Flask(__name__)
CORS(app)  # Autorise GitHub Pages à communiquer avec le serveur
app.json.ensure_ascii = False

DOWNLOAD_FOLDER = "/tmp"

@app.route('/')
def home():
    return jsonify({"message": "API Clipmaster opérationnelle !", "status": "ok"})

@app.route('/api/process', methods=['POST'])
def process_video():
    data = request.get_json()
    url = data.get('url')
    
    if not url:
        return jsonify({"error": "URL manquante"}), 400

    input_path = os.path.join(DOWNLOAD_FOLDER, "input.mp4")
    output_path = os.path.join(DOWNLOAD_FOLDER, "output_916.mp4")

    # Téléchargement via yt-dlp
    ydl_opts = {
        'format': 'mp4',
        'outtmpl': input_path,
        'overwrites': True
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

    # Recadrage 9:16 via ffmpeg
    ffmpeg_cmd = [
        'ffmpeg', '-y',
        '-i', input_path,
        '-vf', 'crop=ih*(9/16):ih',
        '-c:a', 'copy',
        output_path
    ]

    subprocess.run(ffmpeg_cmd, check=True)

    return send_file(output_path, mimetype='video/mp4')

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 10000))
    app.run(host='0.0.0.0', port=port)
