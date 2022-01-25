function sigma = SmoothSign(s,e)
    if abs(s)>=e
        a1 = s/abs(s);
    else
        a1 = s/e;
    end
    sigma=a1;
end