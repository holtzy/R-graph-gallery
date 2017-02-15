### QUANTMETRY  ###




#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------
# 		STEP 1 : PREPARATION DES DONNEES
#------------------------------------------------------

# Préparation des données
data=read.table("data.csv" , header=T , sep=",")

# Première observation des données :
summary(data)

# Certaines variables sont des facteurs, je les converti
for (i in c(2:5)) { data[,i]=as.factor(data[,i])}

# J'ai maintenant 7 variables quanti + 4 variables Quali + l'heure.
# Je n'ai pas de donnée manquante
summary(data)

# La variable datetime n'est pas super pratique. Je vais la diviser en plusieurs colonnes : heure + année
data$year=gsub("-.*" , "" , data$datetime)
fun=function(x){strsplit(x," ")[[1]][2] }
data$hour=unlist(lapply(as.character(data$datetime) , fun))	
fun=function(x){strsplit(x,":")[[1]][1] }
data$hour=unlist(lapply(as.character(data$hour) , fun))	
data$hour=as.factor(data$hour)
fun=function(x){strsplit(x,"-")[[1]][2] }
data$month=unlist(lapply(as.character(data$datetime) , fun))	
data$month=as.factor(data$month)




#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#







#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------
# 		STEP 2 : ANALYSE DESCRIPTIVE / COMPREHENSION DES DONNES
#---------------------------------------------------------------

# Première observation : comportement des locations au cours du temps. (les données sont classées dans l'ordre chronologiques)
plot(data$count , pch=20 , cex=0.1)

# Relation entre heure de la journée et nbr de location --> On observe des heures de pointes : 8-10h et 16-18h. Ce sont les heures de départ au travail. Donc l'heure a un rôle prépondérant mais doit bien être utilisé comme variable quali, pas quanti ! On observe aussi que la variabilité est faible la nuit, forte le jour.
boxplot(data$count ~ data$hour , col=terrain.colors(14) , xlab="heure de la journée" , ylab="compte" )

# Relation avec le mois de l'année
boxplot(data$count ~ data$month  , col=heat.colors(14) , xlab="mois" , ylab="compte" )

# Effet année ?
boxplot(data$count ~ data$year  , col="grey" , xlab="année" , ylab="compte" )

# Effet vacance ?
boxplot(data$count ~ data$holiday  , col="grey" , xlab="année" , ylab="compte" )

# Effet weather
boxplot(data$count ~ data$weather  , col="grey" , xlab="année" , ylab="compte" )

# Corrélation entre temp et température ressentie ? --> 0.98, donc inutile de garder les 2 variables.
cor(data$temp , data$atemp)

# Effet Température ? --> Enormément de variabilité, mais avec globalement une augmentation des locations quand il fait chaud (logique). On pourrait transformer cette donnée en var. qualitative ?
plot(data$count ~ data$atemp)
boxplot(data$count ~ cut(data$atemp, breaks=seq(from=0, to=ceiling(max(data$atemp)), by=5))   , col="grey" , xlab="température ressentie" , ylab="compte" )

# Analyse descriptive : distribution des variables quantitatives.
numerical_variables=as.vector(which(sapply(data, is.numeric)==TRUE))
par(mfrow=c(2,4))
for(i in numerical_variables){
        NomVariable=names(data[i])
        hist(data[,i] , xlab=NomVariable , breaks=20 , col=rgb(0.2,0.6,0.8,0.6) , border=F , main=paste("moyenne = ",round(mean(data[,i] , na.rm=T),2) ,sep="")   )
        }

# Et ACP de ces variables quali
library(FactoMineR)
res.PCA = PCA(data[,numerical_variables], scale.unit=TRUE, ncp=4, graph=F ) 
par(mfrow=c(1,2))
plot.PCA(res.PCA, axes=c(1, 2), choix="ind")
plot.PCA(res.PCA, axes=c(1, 2), choix="var")
 
# To know what variable is correlated with each axis :
dimdesc(res.PCA, axes=c(1,2))


# Relation avec toutes les variables quanti ?
par(mfrow=c(4,3))
par(mar=c(0,0,0,0))
for (i in numerical_variables){
	plot(data$count ~ data[,i])
	}

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#



#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------------
# 		STEP 3 : MODIFICATIONS DES DONNEES SUITE AUX OBSERVATIONS + TRAINING SET
#------------------------------------------------------------------------------------------

# Je supprime la température, et ne garde que la température ressentie atemp, car très corrélées.
# Comme on a ajouté une variable "mois", on peut supprimer la variable saison. En effet, au sein d'une saison, on va avoir un comportement différent selon le mois. (Début de l'automne différent de la fin de l'automne par ex!). La variable mois est donc plus informative.
# On supprime la variable "vacance" car très peu de relation avec la quantité de vélo loué. 
# Je supprime "registered" et "casual" ( A regarder si il me reste du temps)
# Je supprime la colonne datetime que j'ai divisé en step1
data=data[ , -c(1,2,3,6,10,11) ]

# Mise en place de training et test set
library(caret)
for_train=createDataPartition(y=data$count , p=0.7 , list=FALSE)
data_train=data[for_train , ]
data_test=data[-for_train , ]

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#








#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------------
# 		STEP 4 : MISE EN PLACE D'UN MODELE / REALISATION DE PREDICTION
#------------------------------------------------------------------------

# Comme l'objectif est de prédire un nombre (le nombre de vélos loués), on va utiliser un algorythme de régression. Boosted Decision Tree Regression ?
# Du coup, pour jauger la qualité du modèle, on va observer le RMSE (root mean square error)

# -- TEST1 : modèle linéaire simple
my_model=train(count ~ workingday + atemp + humidity + windspeed + year + hour + month , data=data_train , method="lm")
summary(my_model)
my_model$finalModel
plot(my_model$finalModel)
# On a clairement un problème : plus la valeur prédite est forte : plus les résidus sont fort : pas d'homoscédascicité.
# Passage de ce modele sur le test fit ? Et comparaison prédiction / réalité !
prediction=predict(my_model , data_test)
plot(prediction ~ data_test$count)
postResample(prediction , data_test$count)

# -- TEST2 : modèle linéaire généralisé
my_model=train(count ~ workingday + atemp + humidity + windspeed + year + hour + month , data=data_train , method="glm")
summary(my_model)
my_model$finalModel
#plot(my_model$finalModel)
# On a clairement un problème : plus la valeur prédite est forte : plus les résidus sont fort : pas d'homoscédascicité.
# Passage de ce modele sur le test fit ? Et comparaison prédiction / réalité !
prediction=predict(my_model , data_test)
plot(prediction ~ data_test$count)
postResample(prediction , data_test$count)


# -- TEST2 : traitement via l'ACP
prepro=preProcess(data_train[,-6]  , method="pca" , pcaComp=2)
data_PCA=predict(prepro , data_train[,-6])
my_model=train(count ~ workingday + atemp + humidity + windspeed + year + hour + month +PC1 + PC2 , data=data_train , method="lm")



# Perspective : 
	- utiliser des time series : En fait ce serait intéressant d'utiliser les données des heures / jours précédents pour estimer.
	- transformer la température en variable qualitative ?