function [best_curve, best_val] = runGA(f,pop_size,max_iter,dim,bounds)
    CR=0.6; MR=0.05;
    X = bounds(1)+(bounds(2)-bounds(1))*rand(pop_size,dim);
    for i=1:pop_size, fit(i)=ObjFunc9(f,X(i,:)); end
    [best_val,idx]=min(fit); best_curve=zeros(1,max_iter);

    for it=1:max_iter
        for i=1:pop_size
            r1=randi(pop_size); while r1==i, r1=randi(pop_size); end
            Xi=X(i,:); Xnew=Xi;
            if rand<CR
                cp=randi([1 dim/2]); Xnew(1:cp)=X(r1,1:cp);
            end
            if rand<MR
                r2=randi(dim); Xnew(r2)=bounds(1)+(bounds(2)-bounds(1))*rand;
            end
            fnew=ObjFunc9(f,Xnew);
            if fnew<fit(i), X(i,:)=Xnew; fit(i)=fnew; end
        end
        [fit,idx]=sort(fit); X=X(idx,:);
        best_curve(it)=fit(1);
    end
    best_val=fit(1);
end
