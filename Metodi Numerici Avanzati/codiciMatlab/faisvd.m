function [U, S, V, audio, fs, audioMatrix, frameLength, hopSize, numFrames] = faisvd(app)
    % Carica il file audio
    [x,fs] = audioread('asdf.wav');  
    sound(x,fs);  
    plot(app.OriginalSignalAxes, x);
    audio = awgn(x,10,'measured');
    filename = 'noisyvoice.wav';  
    audiowrite(filename, audio, fs)
    pause(5)
    sound(audio,fs); 
    plot(app.NoisySignalAxes, audio);
    if size(audio, 2) == 2
        audio = mean(audio, 2);  
    end


    frameLength = 1024;
    overlap = 512;
    hopSize = frameLength - overlap;

    % Crea la matrice audio con finestre sovrapposte
    numFrames = floor((length(audio) - overlap) / hopSize)
    audioMatrix = zeros(frameLength, numFrames);
    for i = 1:numFrames
        startIdx = (i - 1) * hopSize + 1;
        endIdx = startIdx + frameLength - 1;
        audioMatrix(:, i) = audio(startIdx:endIdx);
    end
    disp(size(audioMatrix));
    disp(cond(audioMatrix));
    

    [U, S, V] = svd_qr_hessenberg_shift(audioMatrix);
    singularValues = diag(S);  
   
    plot(app.Valorisingolari,singularValues, 'o-', 'LineWidth', 1.5, 'MarkerSize', 6);
   
end