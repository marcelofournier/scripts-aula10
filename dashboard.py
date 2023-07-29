import pandas as pd
import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Output
import plotly.graph_objs as go
import time

# Função para ler os dados do arquivo e processá-los
def read_data(filename):
    df = pd.read_table(filename, sep='\t', names=['host', 'status'])
    df['status'] = df['status'].str.lower()
    df['color'] = df['status'].map({'up': 'blue', 'down': 'red', 'unknown': 'yellow'})
    return df

# Função para criar o dashboard
def create_dashboard():
    app = dash.Dash(__name__)

    app.layout = html.Div([
        dcc.Graph(id='host-status-graph'),
        dcc.Interval(
            id='interval-component',
            interval=3 * 60 * 1000,  # Atualizar a cada 3 minutos (em milissegundos)
            n_intervals=0
        )
    ])

    @app.callback(
        Output('host-status-graph', 'figure'),
        [dash.dependencies.Input('interval-component', 'n_intervals')]
    )
    def update_graph(n):
        df = read_data('hosts_status.txt')
        trace = go.Bar(
            x=df['host'],
            y=[1] * len(df),
            marker=dict(color=df['color']),
            hoverinfo='none'
        )

        layout = go.Layout(
            title='Status dos Hosts na Rede Local',
            xaxis=dict(showticklabels=False),
            yaxis=dict(showticklabels=False, showgrid=False),
            showlegend=False
        )

        return {'data': [trace], 'layout': layout}

    if __name__ == '__main__':
        app.run_server(debug=True)

create_dashboard()
