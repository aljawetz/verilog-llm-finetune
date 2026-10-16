`timescale 1ns/1ps

module tb_demux_case;

reg [2:0] sel;
reg i;
wire o0, o1, o2, o3, o4, o5, o6, o7;

// Instantiate the module under test
demux_case uut (
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .o3(o3),
    .o4(o4),
    .o5(o5),
    .o6(o6),
    .o7(o7),
    .sel(sel),
    .i(i)
);

initial begin
    // Initialize inputs
    i = 0;
    sel = 3'b000;

    // Test all select lines
    for (integer j = 0; j < 8; j = j + 1) begin
        // Set input signal
        i = 1;
        sel = j[2:0];
        #10; // Wait for the output to settle

        // Check outputs
        if (j == 0 && o0 !== 1) begin
            $display("FAIL: Expected o0 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 1 && o1 !== 1) begin
            $display("FAIL: Expected o1 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 2 && o2 !== 1) begin
            $display("FAIL: Expected o2 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 3 && o3 !== 1) begin
            $display("FAIL: Expected o3 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 4 && o4 !== 1) begin
            $display("FAIL: Expected o4 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 5 && o5 !== 1) begin
            $display("FAIL: Expected o5 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 6 && o6 !== 1) begin
            $display("FAIL: Expected o6 to be 1 when sel is %b", sel);
            $finish;
        end
        else if (j == 7 && o7 !== 1) begin
            $display("FAIL: Expected o7 to be 1 when sel is %b", sel);
            $finish;
        end

        // Check that all other outputs are 0
        for (integer k = 0; k < 8; k = k + 1) begin
            if (k != j && (o0 + o1 + o2 + o3 + o4 + o5 + o6 + o7) !== 1) begin
                $display("FAIL: Expected only one output to be high when sel is %b", sel);
                $finish;
            end
        end
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule