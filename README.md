# Wallet

## Modelo ##

A la clase Wallet se le han añadido los métodos precisos para cumplir con las características del controlador de tabla:

numberOfCurrencies: devuelve el número de divisas que contiene wallet

countOfCurrencies: devuelve el número de billetes de una divisa concreta


Además, se añade:

takeMoney: elimina un billete (Money) de wallet

addCurrencyMoneys: calcula el subtotal de cada divisa


Los tests que se han añadido a WalletTests son:

testPlusInWallet: comprueba que el número de Moneys aumenta cuando se añade un billete

testOnlyExistingMoneyCanBeRemoved: comprueba que sólo los billetes existentes en wallet pueden ser eliminados

testSubtotalIsRight: comprueba que el subtotal se calcula correctamente


## Controladores ##

Se modifican los siguientes métodos en WalletTableViewController:

numberOfSectionsInTableView: devuelve el número de divisas de wallet +1 para el total

numberOfRowsInSection: devuelve el número de billetes de cada divsa +1 para el subtotal


Los tests añadidos en ControllersTests son:

testThatNumberOfCellsIsNumberOfMoneysPlusOne: comprueba que las filas por sección son el número de billetes +1

testThatLastSectionhasOnlyOneCell: comprueba que la última sección sólo tiene una fila, para el total

testThatNumberOfSectionsIsNumberOfEachMoneyPlusOne: comprueba que el número de secciones es el número de divisas más uno