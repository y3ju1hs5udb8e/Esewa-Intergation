Esewa koylin error solution:
use of
    kotlinOptions {
    jvmTarget = '17'
    -> freeCompilerArgs += ["-Xskip-metadata-version-check"] <- (use of this)
    }
in esewa_flutter_sdh => android => build_gradel
freeCompilerArgs += ["-Xskip-metadata-version-check"] this line of code avoids checking kotlin ver to run
#   E s e w a - I n t e r g a t i o n  
 