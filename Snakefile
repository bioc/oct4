DATASETS = ["SRX2236945", "SRX2236946", "SRX2236947", "SRX2236948", "SRX2236949", "SRX2236950", 
            "SRX2236951", "SRX2236952", "SRX2236953", "SRX2236954", "SRX2236955", "SRX2236956"]

SALMON = "/proj/milovelab/bin/salmon-0.12.0_linux_x86_64/bin/salmon"

rule all:
  input: expand("quants/{dataset}/quant.sf", dataset=DATASETS)

rule salmon_quant:
    input:
        r1 = "reads/{sample}_1.fastq",
        r2 = "reads/{sample}_2.fastq",
        index = "/proj/milovelab/anno/gencode.vM20_salmon_0.12.0"
    output:
        "quants/{sample}/quant.sf"
    params:
        dir = "quants/{sample}"
    shell:
        "{SALMON} quant -i {input.index} -l A -p 6 --gcBias --numGibbsSamples 20 -o {params.dir} -1 {input.r1} -2 {input.r2}"
