function ref = updateBadChannels(ref, noisy)
% Update the bad channel lists from ref based on bad channels in noisy
    ref.badChannelsFromNaNs = union(ref.badChannelsFromNaNs, ...
        noisy.badChannelsFromNaNs);
    ref.badChannelsFromNoData = union(ref.badChannelsFromNoData, ...
        noisy.badChannelsFromNoData);
    ref.badChannelsFromHFNoise = union(ref.badChannelsFromHFNoise, ...
        noisy.badChannelsFromHFNoise);
    ref.badChannelsFromCorrelation = union(ref.badChannelsFromCorrelation, ...
        noisy.badChannelsFromCorrelation);
    ref.badChannelsFromDeviation = union(ref.badChannelsFromDeviation, ...
        noisy.badChannelsFromDeviation);
    ref.badChannelsFromRansac = union(ref.badChannelsFromRansac, ...
        noisy.badChannelsFromRansac);
    ref.badChannelsFromDropOuts =  union(ref.badChannelsFromDropOuts, ...
        noisy.badChannelsFromDropOuts);
    ref.all = union(...
              union(ref.badChannelsFromNaNs, ref.badChannelsFromNoData), ...
              union( ...
                union(ref.badChannelsFromHFNoise, ref.badChannelsFromCorrelation), ...
              union( ...  
              union(ref.badChannelsFromDeviation,ref.badChannelsFromRansac), ...
                    ref.badChannelsFromRansac)));
                