<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HostelSetu | Local Network Server</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
        body { background: #0f172a; color: #f8fafc; min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 20px; }
        .card { background: #1e293b; border: 1px solid #334155; border-radius: 16px; padding: 36px; max-width: 600px; width: 100%; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.5); text-align: center; }
        .badge { display: inline-flex; align-items: center; gap: 8px; background: rgba(16, 185, 129, 0.15); color: #10b981; border: 1px solid #10b981; padding: 6px 14px; border-radius: 999px; font-weight: 600; font-size: 14px; margin-bottom: 20px; }
        .dot { width: 8px; height: 8px; background: #10b981; border-radius: 50%; display: inline-block; animation: pulse 1.5s infinite; }
        @keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.3; } }
        h1 { font-size: 28px; font-weight: 800; margin-bottom: 12px; color: #ffffff; }
        p { color: #94a3b8; line-height: 1.6; margin-bottom: 24px; font-size: 15px; }
        .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-bottom: 24px; text-align: left; }
        .box { background: #0f172a; border: 1px solid #334155; border-radius: 10px; padding: 14px; }
        .box-title { color: #64748b; font-size: 12px; font-weight: 600; text-transform: uppercase; margin-bottom: 4px; }
        .box-val { color: #f8fafc; font-size: 14px; font-weight: 600; }
        .btn { display: inline-block; width: 100%; background: #10b981; color: #ffffff; padding: 12px 20px; border-radius: 8px; text-decoration: none; font-weight: 700; font-size: 15px; transition: background 0.2s; }
        .btn:hover { background: #059669; }
    </style>
</head>
<body>
    <div class="card">
        <div class="badge">
            <span class="dot"></span> Connected to Master Server
        </div>
        <h1>HostelSetu Server is Live!</h1>
        <p>Your team connection is successful. Deepanshu, Lavneesh, and Dimple are now synchronized on the local intranet.</p>
        
        <div class="grid">
            <div class="box">
                <div class="box-title">Team</div>
                <div class="box-val">Team 237 (Resence)</div>
            </div>
            <div class="box">
                <div class="box-title">Stack</div>
                <div class="box-val">PHP 8.2 + MySQL 8.0</div>
            </div>
            <div class="box">
                <div class="box-title">Host Server</div>
                <div class="box-val">Piyush's Master Laptop</div>
            </div>
            <div class="box">
                <div class="box-title">Status</div>
                <div class="box-val" style="color:#10b981;">LAN Sync Active</div>
            </div>
        </div>

        <a href="#" class="btn">Ready for Coding</a>
    </div>
</body>
</html>
