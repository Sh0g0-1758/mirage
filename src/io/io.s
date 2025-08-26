.globl outb             # make the labels outb and inb visible outside this file
.globl inb

# outb - send a byte to an I/O port
# stack: [esp + 8] the data byte
#        [esp + 4] the I/O port

outb:
    movb 8(%esp), %al
    movw 4(%esp), %dx
    out  %al    , %dx
    ret

# inb - returns a byte from the given I/O port
# stack: [esp + 4] The address of the I/O port
#        [esp    ] The return address

inb:
    movw 4(%esp), %dx
    in   %dx    , %al
    ret
