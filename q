Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
       ls [-g] [-l]

ls shows you which methods, constants and variables are accessible to Pry. By
default it shows you the local variables defined in the current shell, and any
public methods or instance variables defined on the current object.

The colours used are configurable using Pry.config.ls.*_color, and the separator
is Pry.config.ls.separator.

Pry.config.ls.ceiling is used to hide methods defined higher up in the
inheritance chain, this is by default set to [Object, Module, Class] so that
methods defined on all Objects are omitted. The -v flag can be used to ignore
this setting and show all methods, while the -q can be used to set the ceiling
much lower and show only methods defined on the object or its direct class.

Also check out `find-method` command (run `help find-method`).

    -m, --methods               Show public methods defined on the Object
    -M, --instance-methods      Show public methods defined in a Module or Class
    -p, --ppp                   Show public, protected (in yellow) and private (in green) methods
    -q, --quiet                 Show only methods defined on object.singleton_class and object.class
    -v, --verbose               Show methods and constants on all super-classes (ignores Pry.config.ls.ceiling)
    -g, --globals               Show global variables, including those builtin to Ruby (in cyan)
    -l, --locals                Show hash of local vars, sorted by descending size
    -c, --constants             Show constants, highlighting classes (in blue), and exceptions (in purple).
                                Constants that are pending autoload? are also shown (in yellow)
    -i, --ivars                 Show instance variables (in blue) and class variables (in bright blue)
    -G, --grep                  Filter output by regular expression
    -h, --help                  Show this message.