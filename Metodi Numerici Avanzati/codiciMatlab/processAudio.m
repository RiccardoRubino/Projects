
function processAudio(app, k, U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames)
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

    % Normalizza per evitare clipping
    audio_denoised = audio_denoised / max(abs(audio_denoised));

    

    % Calcola la FFT dell'audio originale e denoised
    N = length(audio);
    N_denoised = length(audio_denoised);
    if N_denoised > N
        N_denoised = N;
    end

    % FFT del segnale originale e denoised
    audio_fft = abs(trasformata_veloce(audio)); 
    audio_denoised_fft = abs(trasformata_veloce(audio_denoised(1:N_denoised)));

    audio_diff_fft = abs(audio_fft) - abs(audio_denoised_fft);

    % Calcola l'asse delle frequenze per la FFT
    f = (0:length(audio_fft)-1) * fs / length(audio_fft); 

    % Limitiamo le frequenze per la metà (da 0 a Nyquist)
    f = f(1:floor(length(f)/2));
    audio_fft = audio_fft(1:floor(length(audio_fft)/2));
    audio_denoised_fft = audio_denoised_fft(1:floor(length(audio_denoised_fft)/2));
    audio_diff_fft = audio_diff_fft(1:floor(length(audio_diff_fft)/2));

    figure;
    sgtitle('Analisi Spettro Frequenza e Denoising', 'FontSize', 14, 'FontWeight', 'bold');

    subplot(3, 1, 1);
    plot(f, abs(audio_fft), 'b', 'LineWidth', 1.5);  
    title('Spettro Frequenza - Audio Originale');
    xlabel('Frequenza (Hz)');
    ylabel('Magnitudine');
    grid on;

    subplot(3, 1, 2);
    plot(f, abs(audio_denoised_fft), 'r', 'LineWidth', 1.5);  
    title('Spettro Frequenza - Audio Denoised');
    xlabel('Frequenza (Hz)');
    ylabel('Magnitudine');
    grid on;

  

  

    figure;
    subplot(4, 1, 1);
    plot(f, abs(audio_fft), 'b', 'LineWidth', 1.5);
    hold on;
    plot(f, abs(audio_denoised_fft), 'r', 'LineWidth', 1.5);
    hold off;
    title('Spettro di Frequenza Originale e Denoised');
    xlabel('Frequenza (Hz)');
    ylabel('Magnitudine');
    legend('Originale', 'Denoised');
    grid on;



    diff_matrix = abs(audioMatrix) - abs(audioMatrix_denoised);
    imagesc(diff_matrix);
    colorbar;
    title('Heatmap delle Differenze temporali per fr');
    xlabel('Frame');
    ylabel('Campione (nel frame)');

    


    % Riproduce l'audio denoised
    plot(app.SvdcleanSignalAxes, audio_denoised);
    sound(audio_denoised, fs);

    progressBar.Text = 'Processamento completato!';
    drawnow;
    progressBar.Text = 'Completato!';
end

