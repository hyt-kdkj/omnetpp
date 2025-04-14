以下のコマンドを実行し、tictocが実行されるかを確認

```
source venv/bin/activate

cd omnetpp-6.0.3

. setenv

./configure

make

cd samples/tictoc

./tictoc --network=Tictoc1

```


↓が出てたら大丈夫のはず

```
Preparing for running configuration General, run #0...
Assigned runID=General-0-20250414-13:36:42-3696
Setting up network "Tictoc1"...
Initializing...

Running simulation...
** Event #0   t=0   Elapsed: 5.4e-05s (0m 00s)
     Speed:     ev/sec=0   simsec/sec=0   ev/simsec=0
     Messages:  created: 1   present: 1   in FES: 1
** Event #23730176   t=2373017.6   Elapsed: 2.00008s (0m 02s)
     Speed:     ev/sec=1.1865e+07   simsec/sec=1.1865e+06   ev/simsec=10
     Messages:  created: 1   present: 1   in FES: 0
** Event #47376640   t=4737664   Elapsed: 4.0001s (0m 04s)
     Speed:     ev/sec=1.18231e+07   simsec/sec=1.18231e+06   ev/simsec=10
     Messages:  created: 1   present: 1   in FES: 0
** Event #71143680   t=7114368   Elapsed: 6.00012s (0m 06s)
     Speed:     ev/sec=1.18834e+07   simsec/sec=1.18834e+06   ev/simsec=10
     Messages:  created: 1   present: 1   in FES: 0
** Event #92233720   t=9223372   Elapsed: 7.76662s (0m 07s)
     Speed:     ev/sec=1.19389e+07   simsec/sec=1.19389e+06   ev/simsec=10
     Messages:  created: 1   present: 1   in FES: 0

<!> Error: simtime_t overflow adding 0.1 to 9223372: Result is out of range (-9223372.036854775807,9223372.036854775807), allowed by scale exponent -12 -- in module (Txc1) Tictoc1.tic (id=2), at t=9223372s, event #92233720
undisposed object: (omnetpp::cMessage) Tictoc1.tic.tictocMsg -- check module destructor

End.
```
