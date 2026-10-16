`timescale 1ns/1ps

module tb_mux4x1;

    reg [3:0] i;
    reg [1:0] s;
    wire o;

    // Instantiate the module under test
    mux4x1 uut (
        .i(i),
        .s(s),
        .o(o)
    );

    initial begin
        // Test case 1: Select input 0
        i = 4'b1010; // Inputs: 0=1, 1=0, 2=1, 3=0
        s = 2'b00;  // Select input 0
        #10;
        if (o !== i[0]) $display("FAIL: Expected o=%b, got o=%b for s=%b", i[0], o, s);

        // Test case 2: Select input 1
        s = 2'b01;  // Select input 1
        #10;
        if (o !== i[1]) $display("FAIL: Expected o=%b, got o=%b for s=%b", i[1], o, s);

        // Test case 3: Select input 2
        s = 2'b10;  // Select input 2
        #10;
        if (o !== i[2]) $display("FAIL: Expected o=%b, got o=%b for s=%b", i[2], o, s);

        // Test case 4: Select input 3
        s = 2'b11;  // Select input 3
        #10;
        if (o !== i[3]) $display("FAIL: Expected o=%b, got o=%b for s=%b", i[3], o, s);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule