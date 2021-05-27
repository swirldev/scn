# The observed and fitted value
local(
  {
    y_bar<-mean(elcty$Y)
    x_bar<-mean(elcty$X)
    elcty$y_dev<-elcty$Y-y_bar
    elcty$x_dev<-elcty$X-x_bar
    elcty$xy_dev<-elcty$x_dev*elcty$y_dev
    b_hat<-sum(elcty$xy_dev)/sum(elcty$x_dev^2)
    a_hat=y_bar-b_hat*x_bar
    fit<-a_hat+b_hat*elcty$X
    print(head(data.frame(Y=elcty$Y,y_hat=fit)))
  }
)
