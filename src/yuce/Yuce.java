package yuce;



import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.CompareFilter;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.hadoop.hbase.util.Bytes;

public class Yuce {
	
   public static String[][] num=new String[30][5];//查询结果数组
   public static String agentid="o100";
 
   public Double[] gailv=new Double[30];//概率
   public int arr[]=new int[30];
   public static Connection conn;
   public static Configuration conf = HBaseConfiguration.create();
	PrintWriter  writer  = null; 
   java.util.Random random=new java.util.Random();
   public static String result[][]=new String[30][6];
   public Yuce()
  	{
  		conf.set("hbase.zookeeper.quorum", "localhost");
  		//hbase路径
  		conf.set("hbase.rootdir", "hdfs://localhost:9000/hbase");
  		try {
  			//建立连接
  			conn = ConnectionFactory.createConnection(conf);
  			System.out.println("连接成功");
  		} catch (IOException e)
  		{
  			System.out.println("连接失败");
  			e.printStackTrace();
  		}
  		
  		
  	}
   public void search()
	{
		
	    try
	    {
	   HTable table = new HTable(conf, "yuce");  
       Scan s = new Scan();  
       Filter filter=new QualifierFilter(CompareFilter.CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes(agentid)));
            s.setFilter(filter);
       ResultScanner rs = table.getScanner(s);  
      
//                          for (int i = 0; rs.next(); i++) {
//	            	        for (int j = 0; j < 5; j++) {
//	            	            num[i][j] = rs.getObject(j+1).toString();
//	            	        
//	            	        }
//	            	    }
//	            
	            
	          
	    	}
	            catch (Exception e) {  
		            e.printStackTrace();
		            }
	           
	            	for(int j=0;j<num.length;j++)
	            	{
	            		//num[2][j]
	            		if(num[j][2]==null)
	            		 {
	            			 gailv[j]=0.000000000000000000000;
	            			 
	            	     }
	            		/*System.out.println(num[j][2]);*/
	            		 if(num[j][2]!=null)
	            			{
	            			gailv[j]=Double.parseDouble(num[j][2])/91.0;
	            			arr[j]=j;
	            			}
	            		 System.out.println(num[j][2]+"kkwh"+gailv[j]+"hj"+j);
	            			/*System.out.println(gailv[j]+"456");*/
	            		 }
        }
   public static int[] randomArray(int min,int max,int n){  
	    int len = max-min+1;  
	      
	    if(max < min || n > len){  
	        return null;  
	    }  
	      
	    //初始化给定范围的待选数组  
	    int[] source = new int[len];  
	       for (int i = min; i < min+len; i++){  
	        source[i-min] = i;  
	       }  
	         
	       int[] result = new int[n];  
	       Random rd = new Random();  
	       int index = 0;  
	       for (int i = 0; i < result.length; i++) {  
	        //待选数组0到(len-2)随机一个下标  
	           index = Math.abs(rd.nextInt() % len--);  
	           //将随机到的数放入结果集  
	           result[i] = source[index];  
	           //将待选数组中被随机到的数，用待选数组(len-1)下标对应的数替换  
	           source[index] = source[len];  
	       }  
	       return result;  
	}  
   public void daochu() throws FileNotFoundException
   {
	   int n=0;
	   PrintWriter out2 = new PrintWriter("/usr/local/hadoop/yuce2.cvs");
	   out2.println("day_id"+"	"+"sale_id"+"	"+"buy_id"+"	"+"count_num"+"	"+"num"+"	"+"num_count"+'\t');
	  
	   if(LinearRegression.sum>0)
	   {
		   for(int i=0;i<gailv.length;i++)
	   
       {		   
		   if(gailv[i]==null)
		   {
		        n=0;	   
		   }
		   if(gailv[i]!=null)
       	 {
			   n=(int) Math.ceil(gailv[i]*30);
       	 }
		  int[] tmp=Yuce.randomArray(1, 30, n);		      
       	for(int j=0;j<n;j++)
       	{
       	Random random = new Random();
        
       	int ctmp1=(int) (Math.ceil(LinearRegression_count.count/Float.parseFloat(num[arr[i]][2]))+5);
       	int ctmp2=(int) (Math.ceil(LinearRegression_count.count/Float.parseFloat(num[arr[i]][2]))-5);
       	int count=random.nextInt(ctmp1)%(ctmp1-ctmp2+1)+ctmp2;
       	int stmp1=(int)(Math.ceil(LinearRegression.sum/Float.parseFloat(num[arr[i]][2]))+100);
       	int stmp2=(int)(Math.ceil(LinearRegression.sum/Float.parseFloat(num[arr[i]][2]))-100);
       	int sum=random.nextInt(stmp1)%(stmp1-stmp2+1)+stmp2;
       
       	out2.println(tmp[j]+"	"+agentid+"	"+num[arr[i]][1]+"	"+Math.ceil(gailv[i]*30)+"	"+count+"	"+sum);
          }
       	}
	 

	     out2.close(); }
	   else
	   {
			out2.println("未来一个月无交易信息");
			 out2.close();
			
	   }
   }
	  
	public static void main(String[] args) throws FileNotFoundException {
		Yuce db=new Yuce();
		LinearRegression_count.main(args);
		LinearRegression.main(args);
			db.search();
	       db.daochu();
			 
	}

}
