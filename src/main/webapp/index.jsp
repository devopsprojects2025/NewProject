<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Tools Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Source+Code+Pro&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --success: #2ecc71;
            --danger: #e74c3c;
            --warning: #f39c12;
            --dark: #34495e;
            --light: #ecf0f1;
            --gray: #95a5a6;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
            color: var(--primary);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background: linear-gradient(135deg, var(--primary), var(--dark));
            color: white;
            padding: 20px 0;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 10px;
            color: var(--secondary);
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 20px;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            padding: 5px 10px;
            border-radius: 4px;
        }
        
        nav ul li a:hover {
            color: var(--secondary);
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .hero {
            text-align: center;
            padding: 40px 0;
            margin-bottom: 40px;
        }
        
        .hero h1 {
            font-size: 42px;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .hero p {
            font-size: 18px;
            color: var(--gray);
            max-width: 800px;
            margin: 0 auto 30px;
        }
        
        .btn {
            display: inline-block;
            background-color: var(--secondary);
            color: white;
            padding: 12px 24px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        
        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .btn-outline {
            background-color: transparent;
            border: 2px solid var(--secondary);
            color: var(--secondary);
        }
        
        .btn-outline:hover {
            background-color: var(--secondary);
            color: white;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 25px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .card-title {
            font-size: 18px;
            font-weight: 500;
            color: var(--primary);
        }
        
        .card-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(52, 152, 219, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--secondary);
        }
        
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status-success {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success);
        }
        
        .status-warning {
            background-color: rgba(243, 156, 18, 0.1);
            color: var(--warning);
        }
        
        .status-danger {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger);
        }
        
        .log-viewer {
            background-color: #1e1e1e;
            color: #d4d4d4;
            font-family: 'Source Code Pro', monospace;
            padding: 15px;
            border-radius: 4px;
            height: 300px;
            overflow-y: auto;
            margin-bottom: 15px;
        }
        
        .log-entry {
            margin-bottom: 5px;
            font-size: 13px;
            line-height: 1.5;
            white-space: pre-wrap;
        }
        
        .log-info {
            color: #3794ff;
        }
        
        .log-warning {
            color: #ffcc00;
        }
        
        .log-error {
            color: #f44747;
        }
        
        .log-success {
            color: #4ec9b0;
        }
        
        .pipeline {
            position: relative;
            padding-left: 40px;
        }
        
        .pipeline::before {
            content: '';
            position: absolute;
            left: 20px;
            top: 0;
            bottom: 0;
            width: 2px;
            background-color: #eee;
        }
        
        .pipeline-step {
            position: relative;
            margin-bottom: 20px;
            padding: 15px;
            background-color: white;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        
        .pipeline-step::before {
            content: '';
            position: absolute;
            left: -30px;
            top: 24px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: var(--gray);
            border: 2px solid white;
        }
        
        .pipeline-step.active::before {
            background-color: var(--secondary);
        }
        
        .pipeline-step.success::before {
            background-color: var(--success);
        }
        
        .pipeline-step.failed::before {
            background-color: var(--danger);
        }
        
        .pipeline-step.running::before {
            background-color: var(--warning);
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0% { opacity: 1; }
            50% { opacity: 0.5; }
            100% { opacity: 1; }
        }
        
        .pipeline-step-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .pipeline-step-title {
            font-weight: 500;
        }
        
        .pipeline-step-duration {
            color: var(--gray);
            font-size: 13px;
        }
        
        .resource-meter {
            margin-bottom: 15px;
        }
        
        .meter-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 14px;
        }
        
        .meter-bar {
            height: 8px;
            background-color: #eee;
            border-radius: 4px;
            overflow: hidden;
        }
        
        .meter-fill {
            height: 100%;
            border-radius: 4px;
        }
        
        .cpu-fill {
            background-color: var(--secondary);
            width: 65%;
        }
        
        .memory-fill {
            background-color: var(--success);
            width: 45%;
        }
        
        .disk-fill {
            background-color: var(--warning);
            width: 30%;
        }
        
        .deployment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 15px;
        }
        
        .deployment-item {
            background-color: white;
            border-radius: 6px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            border-left: 4px solid var(--secondary);
        }
        
        .deployment-item.failed {
            border-left-color: var(--danger);
        }
        
        .deployment-item.running {
            border-left-color: var(--warning);
        }
        
        .deployment-name {
            font-weight: 500;
            margin-bottom: 5px;
        }
        
        .deployment-meta {
            font-size: 13px;
            color: var(--gray);
        }
        
        footer {
            text-align: center;
            padding: 30px 0;
            color: var(--gray);
            font-size: 14px;
            border-top: 1px solid #eee;
            margin-top: 50px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }
            
            nav ul {
                margin-top: 20px;
                justify-content: center;
            }
            
            nav ul li {
                margin: 0 10px;
            }
            
            .hero h1 {
                font-size: 32px;
            }
            
            .dashboard {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">
                <i>⚙️</i>
                <span>DevOps Dashboard</span>
            </div>
            <nav>
                <ul>
                    <li><a href="#dashboard">Dashboard</a></li>
                    <li><a href="#deployments">Deployments</a></li>
                    <li><a href="#logs">Logs</a></li>
                    <li><a href="#pipelines">Pipelines</a></li>
                    <li><a href="#resources">Resources</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main class="container">
        <section class="hero">
            <h1>Your Complete DevOps Toolkit</h1>
            <p>Monitor, deploy, and manage your infrastructure with this all-in-one DevOps dashboard. Get real-time insights into your systems and streamline your development workflow.</p>
            <a href="#dashboard" class="btn">Get Started</a>
            <a href="#documentation" class="btn btn-outline">Documentation</a>
        </section>
        
        <section id="dashboard">
            <h2 class="section-title">System Overview</h2>
            <div class="dashboard">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">System Health</h3>
                        <div class="card-icon">📊</div>
                    </div>
                    <div class="resource-meter">
                        <div class="meter-label">
                            <span>CPU Usage</span>
                            <span>65%</span>
                        </div>
                        <div class="meter-bar">
                            <div class="meter-fill cpu-fill"></div>
                        </div>
                    </div>
                    <div class="resource-meter">
                        <div class="meter-label">
                            <span>Memory Usage</span>
                            <span>45%</span>
                        </div>
                        <div class="meter-bar">
                            <div class="meter-fill memory-fill"></div>
                        </div>
                    </div>
                    <div class="resource-meter">
                        <div class="meter-label">
                            <span>Disk Usage</span>
                            <span>30%</span>
                        </div>
                        <div class="meter-bar">
                            <div class="meter-fill disk-fill"></div>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Recent Alerts</h3>
                        <div class="card-icon">⚠️</div>
                    </div>
                    <div id="alerts-container">
                        <div class="alert-item">
                            <p><strong>High CPU Load</strong> on server web-01</p>
                            <span class="status-badge status-warning">Warning</span>
                            <p class="alert-time">10 minutes ago</p>
                        </div>
                        <div class="alert-item">
                            <p><strong>Deployment failed</strong> for service payment-api</p>
                            <span class="status-badge status-danger">Critical</span>
                            <p class="alert-time">1 hour ago</p>
                        </div>
                        <div class="alert-item">
                            <p><strong>New version available</strong> for Docker</p>
                            <span class="status-badge status-success">Info</span>
                            <p class="alert-time">3 hours ago</p>
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Uptime Monitoring</h3>
                        <div class="card-icon">⏱️</div>
                    </div>
                    <canvas id="uptimeChart" height="200"></canvas>
                </div>
            </div>
        </section>
        
        <section id="deployments">
            <h2 class="section-title">Deployment Status</h2>
            <div class="dashboard">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Current Deployments</h3>
                        <div class="card-icon">🚀</div>
                    </div>
                    <div class="deployment-grid">
                        <div class="deployment-item">
                            <div class="deployment-name">Frontend v2.1.5</div>
                            <div class="deployment-meta">Production</div>
                            <div class="status-badge status-success">Active</div>
                        </div>
                        <div class="deployment-item running">
                            <div class="deployment-name">Backend v1.3.2</div>
                            <div class="deployment-meta">Staging</div>
                            <div class="status-badge status-warning">Deploying</div>
                        </div>
                        <div class="deployment-item">
                            <div class="deployment-name">Auth Service v1.0.0</div>
                            <div class="deployment-meta">Production</div>
                            <div class="status-badge status-success">Active</div>
                        </div>
                        <div class="deployment-item failed">
                            <div class="deployment-name">Payment API v3.2.1</div>
                            <div class="deployment-meta">Staging</div>
                            <div class="status-badge status-danger">Failed</div>
                        </div>
                    </div>
                    <button id="new-deployment-btn" class="btn" style="margin-top: 20px; width: 100%;">New Deployment</button>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Deployment History</h3>
                        <div class="card-icon">📅</div>
                    </div>
                    <canvas id="deploymentChart" height="250"></canvas>
                </div>
            </div>
        </section>
        
        <section id="logs">
            <h2 class="section-title">Log Viewer</h2>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Application Logs</h3>
                    <div class="card-icon">📝</div>
                </div>
                <div class="log-controls" style="margin-bottom: 15px;">
                    <select id="log-source" class="btn btn-outline" style="padding: 8px 12px; margin-right: 10px;">
                        <option value="frontend">Frontend</option>
                        <option value="backend">Backend</option>
                        <option value="database">Database</option>
                        <option value="auth">Auth Service</option>
                    </select>
                    <select id="log-level" class="btn btn-outline" style="padding: 8px 12px; margin-right: 10px;">
                        <option value="all">All Levels</option>
                        <option value="info">Info</option>
                        <option value="warning">Warning</option>
                        <option value="error">Error</option>
                    </select>
                    <button id="refresh-logs" class="btn" style="padding: 8px 16px;">Refresh</button>
                    <button id="clear-logs" class="btn btn-outline" style="padding: 8px 16px;">Clear</button>
                </div>
                <div class="log-viewer" id="log-viewer">
                    <div class="log-entry log-info">[INFO] 2023-06-15 09:12:34 - Frontend server started on port 3000</div>
                    <div class="log-entry log-info">[INFO] 2023-06-15 09:12:35 - Connected to database successfully</div>
                    <div class="log-entry log-warning">[WARNING] 2023-06-15 09:13:22 - High memory usage detected (85%)</div>
                    <div class="log-entry log-info">[INFO] 2023-06-15 09:15:01 - User admin logged in from 192.168.1.5</div>
                    <div class="log-entry log-error">[ERROR] 2023-06-15 09:17:45 - Payment processing failed: Connection timeout</div>
                    <div class="log-entry log-success">[SUCCESS] 2023-06-15 09:18:30 - Deployment completed: frontend v2.1.5</div>
                    <div class="log-entry log-info">[INFO] 2023-06-15 09:20:15 - Cron job executed: database backup</div>
                    <div class="log-entry log-warning">[WARNING] 2023-06-15 09:22:40 - SSL certificate expires in 7 days</div>
                </div>
            </div>
        </section>
        
        <section id="pipelines">
            <h2 class="section-title">CI/CD Pipelines</h2>
            <div class="dashboard">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Active Pipeline</h3>
                        <div class="card-icon">🔧</div>
                    </div>
                    <div class="pipeline">
                        <div class="pipeline-step success">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Code Checkout</div>
                                <div class="pipeline-step-duration">12s</div>
                            </div>
                        </div>
                        <div class="pipeline-step success">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Dependency Installation</div>
                                <div class="pipeline-step-duration">45s</div>
                            </div>
                        </div>
                        <div class="pipeline-step success">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Unit Tests</div>
                                <div class="pipeline-step-duration">1m 23s</div>
                            </div>
                        </div>
                        <div class="pipeline-step running">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Integration Tests</div>
                                <div class="pipeline-step-duration">Running...</div>
                            </div>
                        </div>
                        <div class="pipeline-step">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Build Artifacts</div>
                                <div class="pipeline-step-duration">Pending</div>
                            </div>
                        </div>
                        <div class="pipeline-step">
                            <div class="pipeline-step-header">
                                <div class="pipeline-step-title">Deploy to Staging</div>
                                <div class="pipeline-step-duration">Pending</div>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 20px; display: flex; justify-content: space-between;">
                        <button id="cancel-pipeline" class="btn btn-outline" style="padding: 8px 16px;">Cancel</button>
                        <button id="force-run" class="btn" style="padding: 8px 16px;">Force Run</button>
                    </div>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Pipeline Statistics</h3>
                        <div class="card-icon">📈</div>
                    </div>
                    <canvas id="pipelineChart" height="250"></canvas>
                    <div style="margin-top: 20px; display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div class="stat-card">
                            <div style="font-size: 24px; font-weight: 500; color: var(--success);">92%</div>
                            <div style="font-size: 14px; color: var(--gray);">Success Rate</div>
                        </div>
                        <div class="stat-card">
                            <div style="font-size: 24px; font-weight: 500; color: var(--secondary);">4.2m</div>
                            <div style="font-size: 14px; color: var(--gray);">Avg Duration</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="resources">
            <h2 class="section-title">System Resources</h2>
            <div class="dashboard">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Container Status</h3>
                        <div class="card-icon">🐳</div>
                    </div>
                    <div style="overflow-x: auto;">
                        <table style="width: 100%; border-collapse: collapse;">
                            <thead>
                                <tr style="border-bottom: 1px solid #eee;">
                                    <th style="padding: 10px; text-align: left;">Container</th>
                                    <th style="padding: 10px; text-align: left;">Status</th>
                                    <th style="padding: 10px; text-align: left;">CPU</th>
                                    <th style="padding: 10px; text-align: left;">Memory</th>
                                    <th style="padding: 10px; text-align: left;">Uptime</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="border-bottom: 1px solid #eee;">
                                    <td style="padding: 10px;">frontend-app</td>
                                    <td style="padding: 10px;"><span class="status-badge status-success">Running</span></td>
                                    <td style="padding: 10px;">12%</td>
                                    <td style="padding: 10px;">256MB / 512MB</td>
                                    <td style="padding: 10px;">3d 4h</td>
                                </tr>
                                <tr style="border-bottom: 1px solid #eee;">
                                    <td style="padding: 10px;">backend-api</td>
                                    <td style="padding: 10px;"><span class="status-badge status-success">Running</span></td>
                                    <td style="padding: 10px;">23%</td>
                                    <td style="padding: 10px;">512MB / 1GB</td>
                                    <td style="padding: 10px;">2d 12h</td>
                                </tr>
                                <tr style="border-bottom: 1px solid #eee;">
                                    <td style="padding: 10px;">redis-cache</td>
                                    <td style="padding: 10px;"><span class="status-badge status-success">Running</span></td>
                                    <td style="padding: 10px;">8%</td>
                                    <td style="padding: 10px;">128MB / 256MB</td>
                                    <td style="padding: 10px;">5d 2h</td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">postgres-db</td>
                                    <td style="padding: 10px;"><span class="status-badge status-warning">Restarting</span></td>
                                    <td style="padding: 10px;">-</td>
                                    <td style="padding: 10px;">-</td>
                                    <td style="padding: 10px;">-</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button id="refresh-containers" class="btn" style="margin-top: 20px; width: 100%;">Refresh Containers</button>
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Network Traffic</h3>
                        <div class="card-icon">🌐</div>
                    </div>
                    <canvas id="networkChart" height="250"></canvas>
                    <div style="margin-top: 20px; display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div class="stat-card">
                            <div style="font-size: 24px; font-weight: 500; color: var(--secondary);">1.2 MB/s</div>
                            <div style="font-size: 14px; color: var(--gray);">Inbound</div>
                        </div>
                        <div class="stat-card">
                            <div style="font-size: 24px; font-weight: 500; color: var(--success);">3.4 MB/s</div>
                            <div style="font-size: 14px; color: var(--gray);">Outbound</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <div class="container">
            <p>DevOps Dashboard &copy; 2023 | Built with ❤️ for developers</p>
            <p style="margin-top: 10px; font-size: 12px;">Version 1.2.0 | Last updated: June 15, 2023</p>
        </div>
    </footer>
    
    <script>
        // Initialize charts
        document.addEventListener('DOMContentLoaded', function() {
            // Uptime Chart
            const uptimeCtx = document.getElementById('uptimeChart').getContext('2d');
            const uptimeChart = new Chart(uptimeCtx, {
                type: 'line',
                data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    datasets: [{
                        label: 'Uptime %',
                        data: [99.8, 99.9, 100, 99.7, 99.9, 100, 100],
                        borderColor: '#2ecc71',
                        backgroundColor: 'rgba(46, 204, 113, 0.1)',
                        tension: 0.3,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: false,
                            min: 99,
                            max: 100
                        }
                    }
                }
            });
            
            // Deployment Chart
            const deploymentCtx = document.getElementById('deploymentChart').getContext('2d');
            const deploymentChart = new Chart(deploymentCtx, {
                type: 'bar',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [
                        {
                            label: 'Successful',
                            data: [12, 15, 18, 14, 20, 16],
                            backgroundColor: '#2ecc71'
                        },
                        {
                            label: 'Failed',
                            data: [2, 1, 0, 3, 1, 2],
                            backgroundColor: '#e74c3c'
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            stacked: true,
                        },
                        y: {
                            stacked: true,
                            beginAtZero: true
                        }
                    }
                }
            });
            
            // Pipeline Chart
            const pipelineCtx = document.getElementById('pipelineChart').getContext('2d');
            const pipelineChart = new Chart(pipelineCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Success', 'Failed', 'Running', 'Pending'],
                    datasets: [{
                        data: [85, 7, 3, 5],
                        backgroundColor: [
                            '#2ecc71',
                            '#e74c3c',
                            '#f39c12',
                            '#95a5a6'
                        ],
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    cutout: '70%',
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
            
            // Network Chart
            const networkCtx = document.getElementById('networkChart').getContext('2d');
            const networkChart = new Chart(networkCtx, {
                type: 'line',
                data: {
                    labels: Array.from({length: 24}, (_, i) => i + ':00'),
                    datasets: [
                        {
                            label: 'Inbound (MB)',
                            data: [12, 10, 8, 7, 6, 5, 8, 15, 20, 25, 30, 35, 
                                   40, 38, 35, 32, 30, 28, 25, 22, 20, 18, 15, 13],
                            borderColor: '#3498db',
                            backgroundColor: 'rgba(52, 152, 219, 0.1)',
                            tension: 0.3,
                            fill: true
                        },
                        {
                            label: 'Outbound (MB)',
                            data: [8, 7, 6, 5, 4, 6, 10, 15, 20, 25, 30, 35, 
                                   45, 50, 48, 45, 42, 40, 38, 35, 32, 28, 25, 20],
                            borderColor: '#2ecc71',
                            backgroundColor: 'rgba(46, 204, 113, 0.1)',
                            tension: 0.3,
                            fill: true
                        }
                    ]
                },
                options: {
                    responsive: true,
                    interaction: {
                        mode: 'index',
                        intersect: false
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            
            // Simulate pipeline progress
            let pipelineInterval;
            const pipelineSteps = document.querySelectorAll('.pipeline-step');
            let currentStep = 3; // Starting at integration tests
            
            function simulatePipeline() {
                if (currentStep >= pipelineSteps.length) {
                    clearInterval(pipelineInterval);
                    return;
                }
                
                // Mark current step as completed
                pipelineSteps[currentStep].classList.remove('running');
                pipelineSteps[currentStep].classList.add('success');
                
                // Move to next step
                currentStep++;
                
                if (currentStep < pipelineSteps.length) {
                    pipelineSteps[currentStep].classList.add('running');
                    const durationElement = pipelineSteps[currentStep].querySelector('.pipeline-step-duration');
                    
                    // Simulate different durations for different steps
                    let duration;
                    if (currentStep === 4) { // Build artifacts
                        duration = '2m 15s';
                    } else if (currentStep === 5) { // Deploy to staging
                        duration = '1m 45s';
                    }
                    
                    durationElement.textContent = 'Running...';
                    
                    // Simulate completion after delay
                    setTimeout(() => {
                        if (currentStep === 5 && Math.random() < 0.2) { // 20% chance of failure on deploy
                            pipelineSteps[currentStep].classList.remove('running');
                            pipelineSteps[currentStep].classList.add('failed');
                            durationElement.textContent = 'Failed';
                            clearInterval(pipelineInterval);
                        } else if (currentStep < pipelineSteps.length) {
                            durationElement.textContent = duration;
                        }
                    }, 3000);
                }
            }
            
            // Start pipeline simulation
            pipelineInterval = setInterval(simulatePipeline, 5000);
            
            // Button event listeners
            document.getElementById('new-deployment-btn').addEventListener('click', function() {
                alert('Starting new deployment process...');
                // In a real app, this would trigger an API call
            });
            
            document.getElementById('refresh-logs').addEventListener('click', function() {
                const logViewer = document.getElementById('log-viewer');
                const newLog = document.createElement('div');
                const logTypes = ['info', 'warning', 'error', 'success'];
                const randomType = logTypes[Math.floor(Math.random() * logTypes.length)];
                const messages = [
                    'User session created',
                    'Database query executed',
                    'Cache updated',
                    'New connection established',
                    'Health check completed',
                    'Scheduled job started',
                    'Request processed',
                    'Configuration loaded'
                ];
                const randomMessage = messages[Math.floor(Math.random() * messages.length)];
                
                newLog.className = `log-entry log-${randomType}`;
                newLog.textContent = `[${randomType.toUpperCase()}] ${new Date().toISOString().replace('T', ' ').substring(0, 19)} - ${randomMessage}`;
                logViewer.insertBefore(newLog, logViewer.firstChild);
                
                // Auto-scroll to top
                logViewer.scrollTop = 0;
            });
            
            document.getElementById('clear-logs').addEventListener('click', function() {
                document.getElementById('log-viewer').innerHTML = '';
            });
            
            document.getElementById('refresh-containers').addEventListener('click', function() {
                alert('Refreshing container status...');
                // In a real app, this would fetch
