
library("ggplot2")
N <- array(c(1,2,13,4,5,6,7,8,9,5,17,12,13,14,15,2,17,8,19,20), dim = c(20));
roll<- function() {
  die <- 1:6
  dice <- sample(die, size = 1, replace = TRUE)
  dice
} 
Play<- function() {
  
    s<-0;
    nr<-0;
    while(s < 20)
    {
      t<-roll();
      nr<-nr+1;
      old<-s;
      s<-old+t;
      if (s > 20)
      {
        s<-old;
        next;
      }
      s<-N[s];
    }
    nr
}

plays<-replicate(1000,Play())
mean(plays)
freq<-table(plays)
percent<-freq/10
frq = as.data.frame(percent)
plot(frq)
