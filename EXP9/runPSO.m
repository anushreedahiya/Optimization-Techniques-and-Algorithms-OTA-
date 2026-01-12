function [best_curve, gbest_val] = runPSO(f,pop_size,max_iter,dim,bounds)
    c1=2; c2=2; w=0.7;
    X = bounds(1)+(bounds(2)-bounds(1))*rand(pop_size,dim);
    V = zeros(pop_size,dim);
    pbest = X;
    for i=1:pop_size, pbest_val(i)=ObjFunc9(f,X(i,:)); end
    [gbest_val,idx]=min(pbest_val); gbest=X(idx,:);
    best_curve=zeros(1,max_iter);

    for t=1:max_iter
        r1=rand(pop_size,dim); r2=rand(pop_size,dim);
        V=w*V+c1*r1.*(pbest-X)+c2*r2.*(gbest-X);
        X=max(min(X+V,bounds(2)),bounds(1));
        for i=1:pop_size, val=ObjFunc9(f,X(i,:));
            if val<pbest_val(i), pbest(i,:)=X(i,:); pbest_val(i)=val; end
        end
        [min_val,min_idx]=min(pbest_val);
        if min_val<gbest_val, gbest_val=min_val; gbest=pbest(min_idx,:); end
        best_curve(t)=gbest_val;
    end
end
