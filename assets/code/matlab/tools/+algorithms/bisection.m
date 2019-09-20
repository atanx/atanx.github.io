function t = bisection(func, t1, t2, err)
    y1 = func(t1);
    y2 = func(t2);
    new_t = (t1+t2)/2;
    new_y = func(new_t);
    if (y1*new_y<0)
        t2 = new_t;
    end
    if(y2*new_y<0)
        t1 = new_t;
    end

    if(abs(t1-t2)<err)
        t = new_t;
    else
       t = algorithms.bisection(func, t1, t2, err); 
    end

end