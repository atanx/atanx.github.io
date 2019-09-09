function t = bisection(t1, t2, err)
    y1 = myfun(t1);
    y2 = myfun(t2);
    new_t = (t1+t2)/2;
    new_y = myfun(new_t);
    if (y1*new_y<0)
        t2 = new_t;
    end
    if(y2*new_y<0)
        t1 = new_t;
    end

    if(abs(t1-t2)<err)
        t = new_t;
    else
       t = bisection(t1, t2, err); 
    end

end