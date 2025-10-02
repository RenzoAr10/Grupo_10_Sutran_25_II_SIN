// Ejecutar
spark-shell -i scripts/03_spark_shell_evidence.scala

// Rango 1..5 y suma
val data = 1 to 5
println("Sum 1..5 = " + data.sum)

// RDD básico
val rdd = sc.parallelize(Seq(1,2,3,4))
println("RDD count = " + rdd.count())

// DataFrame de ejemplo
val df = spark.range(10)
df.show()
