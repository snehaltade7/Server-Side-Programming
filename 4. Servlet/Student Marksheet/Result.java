package p1;

public class Result {
	int tot;
	String res;
	String grade;
	Result rs;
	String resProcess(int m1, int m2,int m3) {
		res=null;
		if(m1>=40 && m2>-40 && m3>-40)
		{
			tot = m1+m2+m3;
			res="PASS";
			if (tot >= 60)
				grade="FIRST CLASS";
			else
				if(tot >=50 && tot <60)
				grade="SECOND CLASS";
				else
					grade="PASS CLASS";
		}
		
		return res;
		
		
	}
	
	Result resGrade(int m1,int m2,int m3)
		{
		Result retResult =new Result();
		double per;
		if(m1>=40 && m2>-40 && m3>-40)
		{
			retResult.tot = m1 +m2+m3;
			per = retResult.tot/3.0;
			retResult.res="PASS";
			
			if (per >= 60.0)
			{
				retResult.grade="FIRST CLASS";
			}
			else if(per >=50.0 && per <60.0) {
						retResult.grade="SECOND CLASS"; }
							      
			else
				
			{   retResult.grade="PASS CLASS";}
		}
		
		
		return retResult;
		
		
	}

}
