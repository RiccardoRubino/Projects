windowWidth = 2000;  
windowHeight = 1000; 

app = struct(); 
app.UIFigure = uifigure('Name', 'SVD Audio Denoising', 'Position', [500, 300, windowWidth, windowHeight], ...
                        'Color', [0.95, 0.95, 0.98], 'Resize', 'off');  


plotWidth = 600;  
plotHeight = 250; 

app.OriginalSignalAxes = uiaxes(app.UIFigure, ...
    'Position', [windowWidth - plotWidth - 50, windowHeight - plotHeight - 100, plotWidth, plotHeight]); 
title(app.OriginalSignalAxes, 'Original Signal');
xlabel(app.OriginalSignalAxes, 'Samples');
ylabel(app.OriginalSignalAxes, 'Amplitude');
grid(app.OriginalSignalAxes, 'on');

app.NoisySignalAxes = uiaxes(app.UIFigure, ...
    'Position', [windowWidth - plotWidth - 50, windowHeight - 2 * plotHeight - 150, plotWidth, plotHeight]);
title(app.NoisySignalAxes, 'Noisy Signal');
xlabel(app.NoisySignalAxes, 'Samples');
ylabel(app.NoisySignalAxes, 'Amplitude');
grid(app.NoisySignalAxes, 'on');

app.SvdcleanSignalAxes = uiaxes(app.UIFigure, ...
    'Position', [windowWidth - plotWidth - 50, windowHeight - 3 * plotHeight - 150, plotWidth, plotHeight]);
title(app.SvdcleanSignalAxes, 'SVD clean Signal');
xlabel(app.SvdcleanSignalAxes, 'Samples');
ylabel(app.SvdcleanSignalAxes, 'Amplitude');
grid(app.SvdcleanSignalAxes, 'on');


valorisingolariWidth = 600;  
valorisingolariHeight = 400; 

valorisingolariX = ((windowWidth - valorisingolariWidth) / 2)-200;  
valorisingolariY = ((windowHeight - valorisingolariHeight) / 2)+100; 

app.Valorisingolari = uiaxes(app.UIFigure, ...
    'Position', [valorisingolariX, valorisingolariY, valorisingolariWidth, valorisingolariHeight]);
title(app.Valorisingolari, 'Singular Values (Principal Components)');
xlabel(app.Valorisingolari, 'Index');
ylabel(app.Valorisingolari, 'Value');
grid(app.Valorisingolari, 'on');

labelWidth = 300;

titleX = (windowWidth - labelWidth) / 2;  
titleY = windowHeight - 50;             

uilabel(app.UIFigure, 'Text', 'Denoising Audio tramite SVD', ...
        'FontSize', 18, 'FontWeight', 'bold', ...
        'Position', [titleX, titleY, labelWidth, 30], 'HorizontalAlignment', 'center', 'FontColor', [0.2, 0.4, 0.6]);

descriptionX = (windowWidth - labelWidth) / 2;  
descriptionY = titleY - 40;                    

uilabel(app.UIFigure, 'Text', 'Seleziona il numero di componenti principali (k):', ...
        'FontSize', 14, 'Position', [descriptionX, descriptionY, labelWidth, 30], ...
        'HorizontalAlignment', 'center', 'FontColor', [0.2, 0.2, 0.2]);
pause(5);
tic;
[U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames] = faisvd(app);
toc;
k_max = min(frameLength, numFrames);
kValues = 0:10:k_max;  

if length(kValues) >= 5
    kKnob = uiknob(app.UIFigure, 'discrete', 'Items', string(kValues), 'Value', string(kValues(5)));  
else
    kKnob = uiknob(app.UIFigure, 'discrete', 'Items', string(kValues), 'Value', string(kValues(end)));  
end

kKnob.Position = [200, 600, 150, 150];  
kKnob.Tooltip = 'Regola il numero di componenti singolari (k)';

kValueLabel = uilabel(app.UIFigure, 'Text', ['k = ' char(kKnob.Value)], ...
                      'FontSize', 14, 'Position', [200, 570, 100, 30], ...
                      'HorizontalAlignment', 'center', 'FontColor', [0.2, 0.4, 0.6]);



addlistener(kKnob, 'ValueChanged', @(src, event) set(kValueLabel, 'Text', ...
                ['k = ' char(kKnob.Value)]));

processButton = uibutton(app.UIFigure, 'push', 'Text', 'Processa Audio', ...
                         'FontSize', 14, 'Position', [220, 800, 160, 40], ...  
                         'BackgroundColor', [0.2, 0.6, 0.8], 'FontColor', 'white', ...
                         'ButtonPushedFcn', @(btn, event) processAudio(app, str2double(kKnob.Value), U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames));

progressBar = uilabel(app.UIFigure, 'Text', 'Pronto', 'FontSize', 12, ...
                      'Position', [420, 30, 160, 20], 'HorizontalAlignment', 'center', 'FontColor', [0.2, 0.4, 0.6]);


autoKButton = uibutton(app.UIFigure, 'push', 'Text', 'Scegli k Ottimale', ...
                       'FontSize', 14, 'Position', [220, 860, 160, 40], ... 
                       'BackgroundColor', [0.2, 0.8, 0.2], 'FontColor', 'white', ...
                       'ButtonPushedFcn', @(btn, event) scelta_ottimale_k(app, U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames,kKnob,kValueLabel,processButton));














