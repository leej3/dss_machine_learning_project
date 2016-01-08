
if (!file.exists("test_set.csv")){ 
    test_url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'
    download.file(test_url, "test_set.csv", method = 'curl')
}
unclassified_testing <- fread('test_set.csv')

pml_write_files = function(x){
    n = length(x)
    for(i in 1:n){
        filename = paste0("problem_id_",i,".txt")
        write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
    }
}

predictions <- as.character(predict(final_model,unclassified_testing))
pml_write_files(predictions)