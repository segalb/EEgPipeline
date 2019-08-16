%This simplifies the command line call to plot the NCL layout. You
%must have an ERP dataset loaded for this command to work (first
%argument). Enter a maximum of 5 bins (conditions). Timestart and
%timeend are in ms. The scale is optional and in microvolts

function ERP = plot_NCL_waves(ERP, bins, yscale, erpsystem, linespec, timestart, timeend)
    if nargin < 3
        yscale = 10;
        autoY = 'on';
    else
        autoY = 'off';
    end
    if nargin < 4
        erpsystem = 'biosemi';
    end
    if nargin < 5
        linespec = {'k-' , 'r-' , 'm-' , 'g-', 'c-'};
    end 
    if nargin < 6
        timestart = -100;
        timeend = 1000;
    end

    if strcmp(erpsystem,'biosemi')
        ERP = pop_ploterps_bss_biosemi( ERP,  bins, [1:34 36],...
            'AutoYlim', autoY, 'Axsize', [ 0.13 0.08], 'BinNum', 'on',...
            'Blc', 'pre', 'Box', [7 5], 'ChLabel', 'on','FontSizeChan',...
            10, 'FontSizeLeg',  12, 'FontSizeTicks',  10, 'LegPos',...
            'bottom','Linespec', {'c-' , 'm--', 'g-', 'g--'},'LineWidth',...
            3, 'Maximize', 'on', 'Style', 'Gina', 'Tag',...
            'ERP_figure', 'Transparency',0, 'xscale',...
            [timestart timeend round(timestart/100)*100:100:round(timeend/100)*100],...
            'YDir', 'reverse','yscale',...
            [ -yscale yscale],  'Blc', '-100    0', 'Linespec', linespec);
    elseif strcmp(erpsystem,'old')
        ERP = pop_ploterps_bss_oldsystem( ERP,  bins, [1:32],...
            'AutoYlim', autoY, 'Axsize', [ 0.13 0.08], 'BinNum', 'on',...
            'Blc', 'pre', 'Box', [7 5], 'ChLabel', 'on','FontSizeChan',...
            10, 'FontSizeLeg',  12, 'FontSizeTicks',  10, 'LegPos',...
            'bottom','Linespec', {'c-' , 'm--', 'g-', 'g--'},'LineWidth',...
            3, 'Maximize', 'on', 'Style', 'Gina', 'Tag',...
            'ERP_figure', 'Transparency',0, 'xscale',...
            [timestart timeend round(timestart/100)*100:100:round(timeend/100)*100],...
            'YDir', 'reverse','yscale',...
            [ -yscale yscale],  'Blc', '-100    0', 'Linespec', linespec);
    else
        disp('INCORRECT SYSTEM SELECTED (choices are biosemi or old), assuming biosemi')
        ERP = pop_ploterps_bss_biosemi( ERP,  bins, [1:34 36],...
            'AutoYlim', autoY, 'Axsize', [ 0.13 0.08], 'BinNum', 'on',...
            'Blc', 'pre', 'Box', [7 5], 'ChLabel', 'on','FontSizeChan',...
            10, 'FontSizeLeg',  12, 'FontSizeTicks',  10, 'LegPos',...
            'bottom','Linespec', {'c-' , 'm--', 'g-', 'g--'},'LineWidth',...
            3, 'Maximize', 'on', 'Style', 'Gina', 'Tag',...
            'ERP_figure', 'Transparency',0, 'xscale',...
            [timestart timeend round(timestart/100)*100:100:round(timeend/100)*100],...
            'YDir', 'reverse','yscale',...
            [ -yscale yscale],  'Blc', '-100    0', 'Linespec', linespec);
    end
end
