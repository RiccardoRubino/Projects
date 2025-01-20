
function scelta_ottimale_k(app, U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames, kKnob, kValueLabel,processButton)

    k_max = min(frameLength, numFrames); 
    totalSingularValueSum = sum(diag(S));  
    originalPower = sum(audio.^2) / length(audio);  % Potenza del segnale originale    
    cumulativeInformation = 0;
    k_initial = 1;

    while cumulativeInformation < 50  
        singularValue = S(k_initial, k_initial);
        cumulativeInformation = cumulativeInformation + (singularValue / totalSingularValueSum) * 100;
        k_initial = k_initial + 1;
        if k_initial > k_max  
            break;
        end
    end

    k = k_initial - 1;
    disp(['K iniziale basato sul 50% dell informazione: ', num2str(k)]);  

    % Calcola la potenza del segnale denoised per k iniziale
    U_com = U(:, 1:k);
    S_com = S(1:k, 1:k);
    V_com = V(:, 1:k);
    
    audioMatrix_denoised = U_com * S_com * V_com';
    audio_denoised = zeros(length(audio), 1);
    
    for i = 1:numFrames
        startIdx = (i - 1) * hopSize + 1;
        endIdx = min(startIdx + frameLength - 1, length(audio));
        audio_denoised(startIdx:endIdx) = audio_denoised(startIdx:endIdx) + audioMatrix_denoised(:, i);
    end
    
    denoisedPower = sum(audio_denoised.^2) / length(audio_denoised);
    disp(['Denoised potenza (k iniziale): ', num2str(denoisedPower)]);  

    % Regola k in base alla potenza denoised
    if denoisedPower < originalPower  
        while denoisedPower < originalPower && k < k_max
            k = k + 1;
            U_com = U(:, 1:k);
            S_com = S(1:k, 1:k);
            V_com = V(:, 1:k);
            
            audioMatrix_denoised = U_com * S_com * V_com';
            audio_denoised = zeros(length(audio), 1);
            for i = 1:numFrames
                startIdx = (i - 1) * hopSize + 1;
                endIdx = min(startIdx + frameLength - 1, length(audio));
                audio_denoised(startIdx:endIdx) = audio_denoised(startIdx:endIdx) + audioMatrix_denoised(:, i);
            end
            
            denoisedPower = sum(audio_denoised.^2) / length(audio_denoised);
            if k > floor(0.65 * k_max)
                break;  % Non supera il 65% dell'informazione
            end
        end
    elseif denoisedPower > 1.1 * originalPower  
        while denoisedPower > 1.1 * originalPower && k > ceil(0.3 * k_max)
            k = k - 1;
            U_com = U(:, 1:k);
            S_com = S(1:k, 1:k);
            V_com = V(:, 1:k);
            
            audioMatrix_denoised = U_com * S_com * V_com';
            audio_denoised = zeros(length(audio), 1);
            for i = 1:numFrames
                startIdx = (i - 1) * hopSize + 1;
                endIdx = min(startIdx + frameLength - 1, length(audio));
                audio_denoised(startIdx:endIdx) = audio_denoised(startIdx:endIdx) + audioMatrix_denoised(:, i);
            end
            
            denoisedPower = sum(audio_denoised.^2) / length(audio_denoised);
            if k < ceil(0.3 * k_max)
                break;  
            end
        end
    end
    
    disp(['Miglior k basandosi sulla potenza e l informazione: ', num2str(k)]); 

    kKnob.Visible = 'off';
    kValueLabel.Visible = 'off';
    processButton.Visible='off';
    uilabel(app.UIFigure, 'Text', ['Miglior valore di k calcolato in base alla potenza e informazione: k = ' num2str(k)], ...
        'FontSize', 14, 'Position', [200, 600, 250, 60], ...
        'HorizontalAlignment', 'center', 'FontColor', [0.2, 0.4, 0.6], ...
        'WordWrap', 'on');
    
    % Ricostruisci il segnale audio denoised con il miglior k
    U_com = U(:, 1:k);
    S_com = S(1:k, 1:k);
    V_com = V(:, 1:k);
    
    audioMatrix_denoised = U_com * S_com * V_com';
    audio_denoised = zeros(length(audio), 1);
    for i = 1:numFrames
        startIdx = (i - 1) * hopSize + 1;
        endIdx = min(startIdx + frameLength - 1, length(audio));
        audio_denoised(startIdx:endIdx) = audio_denoised(startIdx:endIdx) + audioMatrix_denoised(:, i);
    end
    
    processAudio(app, k, U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames);
end
